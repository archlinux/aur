# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('jed-snapshot' 'rgrep')
_pkgver=0.99.20-148
pkgver=${_pkgver//-/.}
_pkgname=${pkgname/-snapshot/}
pkgrel=1
pkgdesc="A freely available text editor - Latest development version"
arch=('i686' 'x86_64')
url="http://www.jedsoft.org/snapshots/"
license=('GPL')
makedepends=('libxext' 'libxt')
source=("http://www.jedsoft.org/snapshots/jed-pre${_pkgver}.tar.gz")
sha256sums=('edcbf9da542dee9e66c0f8c3a336817f181d97042e65db35ffdcdff06793ef02')
install="$pkgname.install"

prepare() {
  cd ${_pkgname}-pre${_pkgver}
  sed \
    -e "s|\(^all.*\)|\1 xjed rgrep|" \
    -e "s|..DEST.*doc|${pkgdir}/usr/share/doc/${pkgname}|g" \
    -i src/Makefile.in 
}

build() {
  cd ${_pkgname}-pre${_pkgver}
  ./configure --prefix=/usr JED_ROOT=/usr/share/jed
  make
}

package_jed-snapshot() {
  provides=('jed')
  conflicts=('jed')
  depends=('gpm' 'slang' 'libxft')
  cd ${_pkgname}-pre${_pkgver}
  make DESTDIR="${pkgdir}" install
}

package_rgrep() {
  depends=('slang')
  install -Dm755 ${_pkgname}-pre${_pkgver}/src/objs/rgrep "$pkgdir"/usr/bin/rgrep
}
