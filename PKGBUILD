# Maintainer: mirh
# Contributor: superlex
# Contributor: Patryk < patryk at kowalczyk ws>
# Contributor: Jozef Riha <jose1711 at gmail dot com>

pkgbase=smartcam
pkgname=(smartcam smartcam-dkms)
pkgver=1.4.0
pkgrel=18
pkgdesc="utility that turns a Symbian or Android phones with bluetooth or wifi and camera into a handy webcam ready to use with your PC"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://smartcam.sourceforge.net/"
makedepends=('linux-headers')
install=smartcam.install
source=("https://github.com/mirh/${pkgbase}/archive/${pkgver}.zip"
        'dkms.conf')

sha1sums=('f555c37a999e08fc25d7167228a99e39b915f34e'
          'f748ca9e55642122bd6669930d01d2f9c722874d')

build() {
    cd $srcdir/$pkgbase-$pkgver
    CPPFLAGS="-fpermissive" ./configure --prefix=/usr
    make
}

package_smartcam() {
    pkgdesc+=" - program"
    depends=('gconf' 'bluez-libs' 'hicolor-icon-theme' 'intltool')

    # Install smartcam application
    cd $srcdir/$pkgbase-$pkgver
    make DESTDIR="${pkgdir}" install

    # License
    install -Dm644 ${srcdir}/$pkgbase-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgbase/COPYING"
}

package_smartcam-dkms() {
    pkgdesc+=" - out-of-tree module"
    depends=('dkms')

    # Preparing to build smartcam module with dkms
    dkms_dir="$pkgdir/usr/src/$pkgbase-$pkgver"

    mkdir -p                                               $dkms_dir
    cp -a       ${srcdir}/$pkgbase-$pkgver/driver_src/*    $dkms_dir
    cp          ${srcdir}/dkms.conf                        $dkms_dir
}
