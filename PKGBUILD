# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Martin Reboredo <yakoyoku@gmail.com>
pkgname='libmongocrypt'
pkgver='1.20.1'
_mongocver='2.3.3'
pkgrel='1'
pkgdesc='C library for client side and queryable encryption in MongoDB'
arch=('x86_64' 'aarch64')
url="https://github.com/mongodb/$pkgname"
license=('Apache-2.0 AND BSD-3-Clause AND ISC AND MIT')
makedepends=('cmake' 'git')
provides=('libkms_message.so' 'libmongocrypt.so')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-mongoc.tar.gz::https://github.com/mongodb/mongo-c-driver/archive/refs/tags/$_mongocver.tar.gz"
	"$pkgname-$pkgver-freebsd-LICENSE::https://github.com/freebsd/freebsd-src/raw/e7c6cef9514d3bb1f14a30a5ee871231523e43db/lib/libc/stdlib/merge.c"
	"$pkgname-$pkgver-dirent-LICENSE::https://github.com/tronkko/dirent/raw/a3e9db58aa4be4972054e77a455c916ffea2e42c/LICENSE"
)
b2sums=('d625b0a44c8510ad08c9e113e04bdb6dd8a31015745189f89d28284bfae79b774a1a20382ddff1edbe02ab0fd84b90d83cbc05bc0dd2c22babe60bb3f3be4852'
        '1aed87f8557e958ccd4779353d49c87a809588bb387441c64c0cd61c82290fef169ff164722fa6c016dbe76217fe074a90d74c4cccf4bf4b46ff207e73dad126'
        '3299a8abcb532c5322dd69d2f4ad39245124c1b79f0c2c347626698bc4106c00b2cbd1781676eba879e54c3e079488bb8b649aada0b3f0edc552b1a047907e10'
        '60ae76d99f94549a84bfe9681e8c79b00993b9d2eabfefde2382c9ff7677f4395f84d67995b0a680cdb033475a0a561b092b6b3ef9b039e037b9f4a45a373a86')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"

	cmake -S '.' -B 'build/' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='lib' \
		-DBUILD_VERSION="$pkgver" \
		-DBUILD_TESTING=OFF \
		-DENABLE_ONLINE_TESTS=OFF \
		-DENABLE_STATIC=OFF \
		-DMONGOCRYPT_MONGOC_DIR="$srcdir/mongo-c-driver-$_mongocver/" \
		-DUSE_SHARED_LIBBSON=OFF \
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
