# Maintainer: notnog <qeefehosk@mozmail.com>

pkgname=mythes-pt_pt-git
_pkg_git_src='https://github.com/LibreOffice/dictionaries.git'
pkgver=r1.20201029
pkgrel=1
pkgdesc='Portuguese (European) thesaurus'
arch=('any')
url='https://github.com/LibreOffice/dictionaries/tree/master/pt_PT'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MPL-1.1')
optdepends=('libmythes: offers thesaurus library functions')
makedepends=('git' 'libmythes')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=()
sha256sums=()

pkgver() {
  cd "${srcdir}/dictionaries"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD -- pt_PT/th_pt_PT.dat)" \
    "$(git log -1 --format=%cd --date=format:%Y%m%d -- pt_PT/th_pt_PT.dat)"
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

  cd "${srcdir}/dictionaries/pt_PT"
  /usr/bin/th_gen_idx.pl -o th_pt_PT.idx < th_pt_PT.dat
}

package() {
  cd "${srcdir}/dictionaries/pt_PT"

  install -dm755 "${pkgdir}/usr/share/mythes"
  install -m644 th_pt_PT.dat th_pt_PT.idx "${pkgdir}/usr/share/mythes/"

  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  ln -sv /usr/share/mythes/th_pt_PT.dat "${pkgdir}/usr/share/myspell/dicts/"
  ln -sv /usr/share/mythes/th_pt_PT.idx "${pkgdir}/usr/share/myspell/dicts/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README_th_pt_PT.txt "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.txt"
}
