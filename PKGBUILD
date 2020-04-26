# Maintainer: mirh
# Contributor: superlex
# Contributor: Patryk < patryk at kowalczyk ws>
# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgname=smartcam
pkgver=1.4.0
pkgrel=17
pkgdesc="utility that turns a Symbian or Android phones with bluetooth or wifi and camera into a handy webcam ready to use with your PC"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://smartcam.sourceforge.net/"
depends=('gconf' 'bluez-libs' 'hicolor-icon-theme' 'intltool' 'dkms')
makedepends=('linux-headers')
install=smartcam.install
source=("https://github.com/mirh/${pkgname}/archive/${pkgver}.zip"
        'dkms.conf')

sha1sums=('f555c37a999e08fc25d7167228a99e39b915f34e'
          'f748ca9e55642122bd6669930d01d2f9c722874d')

build() {
    cd $srcdir/$pkgname-$pkgver
    CPPFLAGS="-fpermissive" ./configure --prefix=/usr
    make
}

package() {
    # Install smartcam application
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="${pkgdir}" install

    # Preparing to build smartcam module with dkms
    dkms_dir="$pkgdir/usr/src/$pkgname-$pkgver"

    mkdir -p                                               $dkms_dir
    cp -a       ${srcdir}/$pkgname-$pkgver/driver_src/*    $dkms_dir
    cp          ${srcdir}/dkms.conf                        $dkms_dir

    # License
    install -Dm644 ${srcdir}/$pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
