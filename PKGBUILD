# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=bloaty
pkgver=1.0
pkgrel=1
pkgdesc="a size profiler for binaries"
arch=(x86_64)
url="https://github.com/google/bloaty"
license=('Apache')
depends=(gcc-libs zlib)
makedepends=(cmake)
source=("https://github.com/google/bloaty/releases/download/v$pkgver/bloaty-$pkgver.tar.bz2")
sha256sums=('e1cf9830ba6c455218fdb50e7a8554ff256da749878acfaf77c032140d7ddde0')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

# Not included in the source tarbal, use the git release instead
# check() {
# 	cd "$pkgname-$pkgver"
# 	make test
# }

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	# Prevent a conflict with regular protobuf
	rm "$pkgdir/usr/bin/protoc"*

	# Don't cause conflicts with our static libraries
	rm -rf "$pkgdir/usr/"{include,lib64} "$pkgdir/usr/lib/libre2.a"
}
