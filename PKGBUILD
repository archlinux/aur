# Maintainer: kbtz <contact@kbtz.dev>
# Contributor: eNV25 <env252525@gmail.com>

pkgref=keyd
pkgname=keyd-openrc
pkgver=2.4.3.r63.02c77af
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='A key remapping daemon for linux'
url='https://github.com/rvaiya/keyd'
license=('MIT')
makedepends=(git)
depends=(openrc)
provides=($pkgref)
conflicts=($pkgref)
optdepends=('python3: for keyd-application-mapper')
sha256sums=('SKIP' 'SKIP' 'SKIP')
source=(
	'git+https://github.com/rvaiya/keyd.git'
	tweaks.patch
	keyd.init
)

pkgver() {
	cd $srcdir/$pkgref
	git describe --long --tags | sed -E '
		s/([^-]*-)g/r\1/
		s/-/./g
		s/^v//
	'
}

prepare(){ 
	patch -p0 -d $srcdir/$pkgref -i $srcdir/tweaks.patch
}

build() {
	cd $srcdir/$pkgref
	make
}

package() {
	cd $srcdir
	install -Dm755 $pkgref.init $pkgdir/etc/init.d/$pkgref
	install -dm755 $pkgdir/usr/share/libinput
	
	cd $pkgref
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/$pkgref
}
