# Maintainer: mr_s1m0n silverphoneix@disroot.org
pkgname=bsdcoreutils-git
_pkgname=BSDCoreUtils
pkgver=v6.7.r2
pkgrel=1
pkgdesc="Port of OpenBSD & NetBSD coreutils to Linux by DiegoMagdaleno."
arch=('x86_64')
url="https://github.com/DiegoMagdaleno/BSDCoreUtils"
license=('ISC')
depends=('glibc' 'openssl' 'libbsd' 'man-db')
makedepends=('git' 'cmake' 'make' 'byacc')
source=("git+https://github.com/DiegoMagdaleno/BSDCoreUtils.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
}

build() {
	cd "$srcdir/$_pkgname/build"
	cmake .. \
    	-DCMAKE_INSTALL_PREFIX=/opt/BSDuserland \
    	-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir" install
	find src -name "*.1" -exec install -Dm644 "{}" "$pkgdir/usr/local/share/man/BSD/{}" \;
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	echo ""
    	echo "=================================================================="
    	echo "To finish installation, add these lines to your shell config:"
    	echo "export PATH=\"/opt/BSDuserland/bin:\$PATH\""
    	echo "export MANPATH=\"/usr/share/man/bsd:\$MANPATH\""
    	echo "=================================================================="

}
