# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=bluespec-bdw-git
pkgver=r11.5b61fa8
pkgrel=1
pkgdesc='Bluespec Workstation (BDW)'
arch=('x86_64')
url='https://github.com/B-Lang-org/bdw'
license=('BSD')
depends=('bluespec-git' 'tk-itk3')
optdepends=('gtkwave-tcl: gtkwave integration')
makedepends=('git')
source=('git+https://github.com/b-lang-org/bdw.git'
        'bluespec-bdw.desktop')
sha256sums=('SKIP'
            'f4ab26f8f7a2fdcc3c0bfbff39895fb5ceba79e468b72d138cc1178c9f9a62a1')
_prefix="/opt/bluespec"

pkgver() {
  cd "$srcdir/bdw"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/bdw"
}

build(){
  cd "$srcdir/bdw"
  make install
}

package() {
  cd "$srcdir/bdw"
  install -d "${pkgdir}${_prefix}"
  cp -dr --preserve=mode,timestamp ./inst/* "${pkgdir}${_prefix}"

  install -d "${pkgdir}/usr/bin"
  local _prog
  for _prog in bdw; do
    sed -i "s,^BINDIR=.*$,BINDIR=${_prefix}/bin," "${pkgdir}${_prefix}/bin/${_prog}"
    ln -s "${_prefix}/bin/${_prog}" "${pkgdir}/usr/bin"
  done

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/bluespec-bdw.desktop" "${pkgdir}/usr/share/applications/bluespec-bdw.desktop"
}
