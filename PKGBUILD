# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=umip
pkgver=1.0
pkgrel=1
pkgdesc="Open source implementation of Mobile IPv6 and NEMO Basic Support for Linux"
arch=('i686' 'x86_64')
url="http://umip.org/"
license=('GPL')
depends=('openssl' 'ipsec-tools' 'radvd')
makedepends=('autoconf' 'automake bison' 'flex' 'indent')
provides=('mip6d')
conflicts=('mip6d')
replaces=('mip6d')
backup=(etc/mip6d/mip6d.conf)
install=
source=(git://git.umip.org/umip.git#tag=v1.0
umip-mip6d.service)
noextract=()

prepare() {
	cd "$srcdir/$pkgname"
	autoreconf -i
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr --enable-vt
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install

	mkdir -p $pkgdir/etc/mip6d
	cp $srcdir/$pkgname/extras/*.conf $pkgdir/etc/mip6d
	cp $pkgdir/etc/mip6d/example-cn.conf $pkgdir/etc/mip6d/mip6d.conf

	mkdir -p $pkgdir/usr/lib/systemd/system/
	cp $srcdir/umip-mip6d.service $pkgdir/usr/lib/systemd/system/
}
md5sums=('SKIP'
         'b53816cb794648e00cf5970a95e89990')
