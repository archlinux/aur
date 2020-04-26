# Maintainer: mirh
# Contributor: Patryk < patryk at kowalczyk ws>
# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgname=smartcam
pkgver=1.4.0
pkgrel=16
pkgdesc="utility that turns a Symbian or Android phones with bluetooth or wifi and camera into a handy webcam ready to use with your PC"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://smartcam.sourceforge.net/"
depends=('gconf' 'bluez-libs' 'hicolor-icon-theme' 'intltool')
makedepends=('linux-headers')
install=smartcam.install
source=("https://github.com/mirh/${pkgname}/archive/${pkgver}.zip")

sha1sums=('f555c37a999e08fc25d7167228a99e39b915f34e')

build() {
    cd $srcdir/$pkgname-$pkgver
    CPPFLAGS="-fpermissive" ./configure --prefix=/usr
    make

    cd driver_src/
    make -C /usr/lib/modules/`uname -r`/build M=`pwd`
}

package() {
    mkdir -p ${pkgdir}/usr/lib/modules/`uname -r`/kernel/drivers/video
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="${pkgdir}" install
    install -D -m644 driver_src/smartcam.ko "${pkgdir}"/usr/lib/modules/`uname -r`/kernel/drivers/video/smartcam.ko
}
