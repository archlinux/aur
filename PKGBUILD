# Maintainer: notnog <qeefehosk@mozmail.com>

pkgname=hyphen-pt_pt-git
_pkg_git_src='https://github.com/LibreOffice/dictionaries.git'
pkgver=r1.20121016
pkgrel=1
pkgdesc='Portuguese (European) hyphenation rules'
arch=('any')
url='https://github.com/LibreOffice/dictionaries/tree/master/pt_PT'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MPL-1.1')
optdepends=('hyphen: offers hyphenation library functions')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=()
sha256sums=()

pkgver() {
  cd "${srcdir}/dictionaries"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD -- pt_PT/hyph_pt_PT.dic)" \
    "$(git log -1 --format=%cd --date=format:%Y%m%d -- pt_PT/hyph_pt_PT.dic)"
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

package() {
  cd "${srcdir}/dictionaries/pt_PT"

  install -dm755 "${pkgdir}/usr/share/hyphen"
  install -m644 hyph_pt_PT.dic "${pkgdir}/usr/share/hyphen/"

  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  ln -sv /usr/share/hyphen/hyph_pt_PT.dic "${pkgdir}/usr/share/myspell/dicts/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README_hyph_pt_PT.txt "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.txt"
}
