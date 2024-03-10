# Maintainer: Matthew Tran <0e4ef622 at gmail.com>
# Contributor: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=libdogleg-git
pkgver=v0.16.r1.g1f88d01
pkgrel=2
pkgdesc="Large-scale nonlinear least-squares optimization library for both sparse and dense problems"
arch=('i686' 'x86_64')
url="https://github.com/dkogan/libdogleg"
license=('LGPL-3.0-only')
depends=('suitesparse' 'lapack' 'glibc')
makedepends=('make' 'gcc' 'mrbuild')
provides=('libdogleg')
conflicts=('libdogleg')
source=("${pkgname%-git}::git+https://github.com/dkogan/libdogleg.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	suffix=$(git describe --long --tags | sed 's/^v//g')
	install -m 755 "libdogleg.so.2.$suffix" -D --target-directory="$pkgdir/usr/lib/"
	pushd $pkgdir/usr/lib/
	ln -s "libdogleg.so.2.$suffix" libdogleg.so.2
	ln -s "libdogleg.so.2.$suffix"  libdogleg.so
	popd
	install -m 644 dogleg.h -D --target-directory="$pkgdir/usr/include/"
	install -m 755 sample -D "$pkgdir/usr/bin/libdogleg-sample"
}
