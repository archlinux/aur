# Maintainer: Darch_7 <noseinundamas1@gmail.com>


pkgname=st-bydarch
pkgver=0.8.2.r6.114304a
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X - Modificado por Darch7'
url='https://github.com/darch7/st.git'
arch=('x86_64')
license=('MIT')
options=('zipman')
depends=('ttf-meslo-nerd-font-powerlevel10k' 'libxft')
makedepends=('ncurses' 'libxext' 'git')
source=("${pkgname}::git+$url")
sha256sums=('SKIP')
provides=('st')
conflicts=('st')

pkgver() {
  cd "${pkgname}/st"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}/st"
  sed -i '/tic /d' Makefile
}

build() {
  cd "${pkgname}/st"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${pkgname}/st"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${srcdir}/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
