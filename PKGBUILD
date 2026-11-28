# Maintainer: kbtz <contact@kbtz.dev>
# Contributor: eNV25 <env252525@gmail.com>

pkgref=keyd
pkgname=keyd-s6
pkgver=2.6.0.r2.f564288
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='A key remapping daemon for linux'
url='https://github.com/rvaiya/keyd'
license=('MIT')
makedepends=(git)
depends=(s6-base)
provides=($pkgref)
conflicts=($pkgref)
backup=('etc/s6/config/keyd.conf')
options=('!debug')
install=$pkgref.install
optdepends=('python3: for keyd-application-mapper')
source=('git+https://github.com/rvaiya/keyd.git'
	Makefile.patch keyd.install keyd.conf keyd.run)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd $srcdir/$pkgref
	git describe --long --tags | sed -E '
		s/([^-]*-)g/r\1/
		s/-/./g
		s/^v//
	'
}

prepare(){ 
	cd "$srcdir/$pkgref"
	patch -Np1 -i "$srcdir/Makefile.patch"
}

build() {
	cd $srcdir/$pkgref
	make
}

package() {
	cd $srcdir/$pkgref

	make DESTDIR=$pkgdir PREFIX=/usr install
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/keyd

	install -Dm644 $srcdir/keyd.conf $pkgdir/etc/s6/config/keyd.conf

	install -d $pkgdir/etc/s6/sv/keyd
	echo "longrun" > $pkgdir/etc/s6/sv/keyd/type
	install -Dm755 $srcdir/keyd.run $pkgdir/etc/s6/sv/keyd/run

	# Set permissions for libinput quirks
	install -dm755 $pkgdir/usr/share/libinput
}
