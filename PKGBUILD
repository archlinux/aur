# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=hypergrep
pkgver=0.1.1
pkgrel=1
pkgdesc="Recursively search directories for a regex pattern using Intel Hyperscan"
arch=('x86_64')
url="https://github.com/p-ranav/hypergrep"
license=('MIT')
depends=('hyperscan' 'libgit2' 'fmt' 'gcc-libs')
makedepends=('cmake' 'ninja' 'pkgconf' 'argparse' 'concurrentqueue')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" 'hypergrep-arch.patch')
sha256sums=('c7348ae2c21fd2a711d73e404f0e5c972430b0acfcde36495e668314c86f015e'
            '7a4b9f46d4e1b43a23edf253fe6f4beb40c2b72a6aa6c660f00c89efeef8945a')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/hypergrep-arch.patch"
}

build() {
	cmake -S "$pkgname-$pkgver" -B build -G Ninja -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	mv "$pkgdir/usr/bin/hg" "$pkgdir/usr/bin/hypergrep"
	install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
