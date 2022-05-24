# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=libdogleg-git
pkgver=v0.15.4.r0.gd8e655b
pkgrel=3
pkgdesc="Large-scale nonlinear least-squares optimization library for both sparse and dense problems"
arch=('i686' 'x86_64')
url="https://github.com/dkogan/libdogleg"
license=('Apache')
groups=('')
depends=('suitesparse')
makedepends=('make' 'gcc')
optdepends=('')
provides=('libdogleg')
conflicts=('libdogleg')
source=("${pkgname%-git}::git+https://github.com/dkogan/libdogleg.git#branch=master"
	"build-fix.patch")
md5sums=('SKIP'
         '82e1b119ee90a326c57b633b5530fe0e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch --directory="${pkgname%-git}" --forward --strip=1 --input="$srcdir/build-fix.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -m 755 libdogleg.so.2.0.15.4 -D --target-directory="$pkgdir/usr/lib/"
	pushd $pkgdir/usr/lib/
	ln -s libdogleg.so.2.0.15.4 libdogleg.so.2
	ln -s libdogleg.so.2.0.15.4 libdogleg.so
	popd
	install -m 644 dogleg.h -D --target-directory="$pkgdir/usr/include/"
	install -m 755 sample -D "$pkgdir/usr/bin/libdogleg-sample"
}
