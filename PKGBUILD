# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('jed-snapshot' 'xjed-snapshot' 'rgrep')
_pkgver=0.99.20-172
pkgver=${_pkgver//-/.}
_pkgname=${pkgname/-snapshot/}
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.jedsoft.org/snapshots/"
license=('GPL')
depends=('gpm' 'slang' 'libxft')
makedepends=('libxext' 'libxt')
source=("http://www.jedsoft.org/snapshots/jed-pre${_pkgver}.tar.gz")
sha256sums=('bdf26476adfb987ffbcfbb772dd2e8e1d904153d119cf1228dc5e646c589bf36')

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
  make xjed
}

package_jed-snapshot() {
  pkgdesc="A freely available text editor - Latest development version"
  provides=('jed')
  conflicts=('jed')
  cd ${_pkgname}-pre${_pkgver}
  make DESTDIR="${pkgdir}" install
  rm "$pkgdir"/usr/bin/xjed
}

package_xjed-snapshot() {
  pkgdesc="A freely available text editor - Latest development version"
  provides=('xjed' 'jed')
  conflicts=('xjed' 'jed')
  cd ${_pkgname}-pre${_pkgver}
  make DESTDIR="${pkgdir}" install
  rm "$pkgdir"/usr/bin/{jed,jed-script}
}

package_rgrep() {
  pkgdesc="Recursive grep"
  install -Dm755 ${_pkgname}-pre${_pkgver}/src/objs/rgrep "$pkgdir"/usr/bin/rgrep
}
