# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: JKAbrams <JKAbrams@AUR>
# Contributor: kevku <kevku@msn.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>

pkgname=openct
pkgver=0.6.20
pkgrel=9
pkgdesc='Implements drivers for several smart card readers'
arch=('i686' 'x86_64')
url='https://github.com/OpenSC/openct/'
license=('LGPL2.1')
backup=('etc/openct.conf')
depends=('pcsclite' 'libusb-compat' 'libtool')
makedepends=('doxygen')
source=("https://github.com/OpenSC/openct/archive/$pkgname-$pkgver.tar.gz"
        'udev-sleep.patch' 'openct.service')
md5sums=('30e416c6c414466f685a5e2db8591c71'
         '1c8484195d3b8445ebdb9fdc2ee87736'
         '0ac8962644f365bce540b24af9b00eda')

prepare() {
    cd $pkgname-$pkgname-$pkgver
    patch -p1 -i "${srcdir}/udev-sleep.patch"

    ./bootstrap
}

build() {
    cd $pkgname-$pkgname-$pkgver
    ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-udev=/usr/lib/udev \
    --enable-usb \
    --enable-pcsc \
    --disable-static

    make
}

package() {
    cd $pkgname-$pkgname-$pkgver

    # Work around broken makefile
    install -d "$pkgdir"/etc
    make DESTDIR="$pkgdir" install

    install -D etc/openct.udev "$pkgdir"/usr/lib/udev/rules.d/95-openct.rules

    install -d "${pkgdir}"/usr/lib/systemd/system
    install "${srcdir}"/openct.service "${pkgdir}"/usr/lib/systemd/system
}
