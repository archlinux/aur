# Maintainer: MartiMcFly <martimcfly at autorisation de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: JKAbrams <JKAbrams@AUR>
# Contributor: kevku <kevku@msn.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>

pkgname=openct-git
pkgver=r1046.a4f3fcb
pkgrel=1
pkgdesc="Implements drivers for several smart card readers and PCSC Lite"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/OpenSC/openct/"
options=('!libtool')
license=("LGPL")
backup=('etc/openct.conf')
depends=('pcsclite'
	 'libusb-compat'
	 'libtool')
makedepends=('doxygen')
source=("$pkgname::git+https://github.com/OpenSC/openct.git"
        'openct.rc'
        'udev-sleep.patch')
md5sums=('SKIP'
         '000bab3e5a98e49159e8190e2b318c74'
         '1c8484195d3b8445ebdb9fdc2ee87736')

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
        cd "$srcdir/$pkgname"
        patch -p1 < "$srcdir"/udev-sleep.patch
        ./bootstrap
        ./configure --prefix=/usr \
	--sbindir=/usr/bin \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--enable-pcsc \
	--with-bundle=/usr/lib/pcsc/drivers \
	--with-udev=/usr/lib/udev \
	--enable-usb \
	--disable-static

        make
}

package() {
        cd "$srcdir/$pkgname"
        # Work around broken makefile
        mkdir "$pkgdir"/etc
        make DESTDIR="$pkgdir" install

        install -D etc/openct.udev "$pkgdir"/usr/lib/udev/rules.d/95-openct.rules
        install -D -m755 "$srcdir"/openct.rc $pkgdir/etc/rc.d/openct

        mkdir -p "$pkgdir"/run/openct
}
