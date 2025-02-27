# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Martin Reboredo <yakoyoku@gmail.com>
pkgname='libmongocrypt'
pkgver='1.13.0'
pkgrel='1'
pkgdesc='C library for client side and queryable encryption in MongoDB'
arch=('x86_64' 'aarch64')
url="https://github.com/mongodb/$pkgname"
license=('Apache-2.0 AND BSD-3-Clause AND ISC AND MIT')
depends=('libbson')
makedepends=('cmake' 'git')
provides=('libkms_message.so' 'libmongocrypt.so')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-shared-libbson.patch::$url/pull/681.patch"
	"$pkgname-$pkgver-freebsd-LICENSE::https://github.com/freebsd/freebsd-src/raw/e7c6cef9514d3bb1f14a30a5ee871231523e43db/lib/libc/stdlib/merge.c"
	"$pkgname-$pkgver-dirent-LICENSE::https://github.com/tronkko/dirent/raw/a3e9db58aa4be4972054e77a455c916ffea2e42c/LICENSE"
)
b2sums=('3b6caed7ebac952f96f7ef53ffdc8de6ee4bc4de8d0c0fab7bb9886f3444f00a51b91595b75a545b1d0d39d38b25881dd61952759aed9459c8ba81e0f509c540'
        'cc34dd00409fb5d2489627b85f4fa13c1a58f80fdd81d02e7adb9d749e4a97f06a52e6ab44978f2941686fc59d3a2112266c9d44c0e03b2d313c51674aeb0ea5'
        '3299a8abcb532c5322dd69d2f4ad39245124c1b79f0c2c347626698bc4106c00b2cbd1781676eba879e54c3e079488bb8b649aada0b3f0edc552b1a047907e10'
        '60ae76d99f94549a84bfe9681e8c79b00993b9d2eabfefde2382c9ff7677f4395f84d67995b0a680cdb033475a0a561b092b6b3ef9b039e037b9f4a45a373a86')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Apply patch to be able to use system libbson exclusively (https://github.com/mongodb/libmongocrypt/pull/681)
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-shared-libbson.patch"
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	cmake -S '.' -B 'build/' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='lib' \
		-DBUILD_VERSION="$pkgver" \
		-DBUILD_TESTING=OFF \
		-DENABLE_ONLINE_TESTS=OFF \
		-DENABLE_STATIC=OFF \
		-DMONGOCRYPT_MONGOC_DIR='USE-SYSTEM' \
		-DUSE_SHARED_LIBBSON=ON \
		-Wno-dev
	cmake --build 'build/'
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	DESTDIR="$pkgdir" cmake --install 'build/'

	head -n33 "../$pkgname-$pkgver-freebsd-LICENSE" > "../$pkgname-$pkgver-freebsd-LICENSE-trimmed"
	install -Dm644 "../$pkgname-$pkgver-freebsd-LICENSE-trimmed" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
	install -Dm644 'kms-message/THIRD_PARTY_NOTICES' "$pkgdir/usr/share/licenses/$pkgname/ISC"
	install -Dm644 "../$pkgname-$pkgver-dirent-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
