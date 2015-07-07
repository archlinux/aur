# Author:
#   Andreas Johansson <stdin dot se>
# Maintainer: 
#   Olivier Biesmans  <o dot archlinux at biesmans dot fr>
# Contributors: 
#   Peter Hultqvist   <endnode dot se>
#   Guzzard           <guzzard at gmail dot com>
pkgname=telldus-core
pkgver=2.1.2
pkgrel=2
pkgdesc="TellStick application and library"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://developer.telldus.se/wiki/TellStickInstallationSource"
license=('GPL2')
depends=('libftdi-compat' 'confuse')
makedepends=('gcc' 'make' 'cmake' 'patch')
options=('!makeflags')
backup=('etc/tellstick.conf')
source=(
    http://download.telldus.se/TellStick/Software/$pkgname/$pkgname-$pkgver.tar.gz
    arch-fix.patch
    telldusd
    telldus.service
)
md5sums=('9016622b10bc84b275efbffe1874d619'
         'af219491b12eb43f14346c78d6d87766'
         '53a57c8500f95482814e95a7e0226e29'
         '2c03c9a95afd4f694f3fed193b8f4811')
build() {
    cd $srcdir/telldus-core-$pkgver/
    patch -p1 < $srcdir/arch-fix.patch
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package () {
    cd $srcdir/telldus-core-$pkgver/
    make DESTDIR="$pkgdir" install
    install -D -m0755 $srcdir/telldusd $pkgdir/etc/rc.d/telldusd || return 1
    install -D -m0755 $srcdir/telldus.service $pkgdir/etc/systemd/system/telldus.service || return 1
}
