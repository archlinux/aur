# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: JKAbrams <JKAbrams@AUR>
# Contributor: kevku <kevku@msn.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>

pkgname=openct
pkgver=0.6.20
pkgrel=8
pkgdesc="Implements drivers for several smart card readers"
arch=('i686' 'x86_64')
url="https://github.com/OpenSC/openct/"
options=('!libtool')
license="LGPL"
backup=('etc/openct.conf')
depends=('pcsclite' 'libusb-compat' 'libtool')
makedepends=('doxygen')
source=("https://github.com/OpenSC/openct/archive/$pkgname-$pkgver.tar.gz"
        'openct.rc'
        'udev-sleep.patch')
md5sums=('30e416c6c414466f685a5e2db8591c71'
         '000bab3e5a98e49159e8190e2b318c74'
         '1c8484195d3b8445ebdb9fdc2ee87736')

build() {
        cd "$srcdir/$pkgname-$pkgname-$pkgver"
        patch -p1 < "$srcdir"/udev-sleep.patch
        ./bootstrap
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
        cd "$srcdir/$pkgname-$pkgname-$pkgver"
        # Work around broken makefile
        mkdir "$pkgdir"/etc
        make DESTDIR="$pkgdir" install

        install -D etc/openct.udev "$pkgdir"/usr/lib/udev/rules.d/95-openct.rules
        install -D -m755 "$srcdir"/openct.rc $pkgdir/etc/rc.d/openct

        mkdir -p "$pkgdir"/run/openct
}
