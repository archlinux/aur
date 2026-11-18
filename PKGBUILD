# Maintainer: notnog <qeefehosk@mozmail.com>

pkgname=hunspell-pt_pt-git
_pkg_git_src='https://github.com/LibreOffice/dictionaries.git'
pkgver=r19.20251023
pkgrel=1
pkgdesc='Portuguese (European, post-orthographic agreement) hunspell dictionaries'
arch=('any')
url='https://github.com/LibreOffice/dictionaries/tree/master/pt_PT'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MPL-1.1')
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('git' 'qt6-webengine')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=()
sha256sums=()

pkgver() {
  cd "${srcdir}/dictionaries"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD -- pt_PT/pt_PT.dic pt_PT/pt_PT.aff)" \
    "$(git log -1 --format=%cd --date=format:%Y%m%d -- pt_PT/pt_PT.dic pt_PT/pt_PT.aff)"
}

prepare() {
  cd "${srcdir}"
  if [ ! -d "dictionaries/.git" ]; then
    git clone --no-checkout --filter=blob:none --sparse "${_pkg_git_src}"
  fi
  cd "dictionaries"
  git sparse-checkout set --no-cone 'pt_PT'
  git checkout master
  git pull --ff-only
}

build() {
  cd "${srcdir}/dictionaries/pt_PT"
  /usr/lib/qt6/qwebengine_convert_dict pt_PT.dic pt_PT.bdic
}

package() {
  cd "${srcdir}/dictionaries/pt_PT"

  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -m644 pt_PT.dic pt_PT.aff "${pkgdir}/usr/share/hunspell/"

  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  ln -sv /usr/share/hunspell/pt_PT.dic "${pkgdir}/usr/share/myspell/dicts/"
  ln -sv /usr/share/hunspell/pt_PT.aff "${pkgdir}/usr/share/myspell/dicts/"

  install -dm755 "${pkgdir}/usr/share/qt6/qtwebengine_dictionaries"
  install -m644 pt_PT.bdic "${pkgdir}/usr/share/qt6/qtwebengine_dictionaries/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README_pt_PT.txt "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.txt"
}
