_p=unreliablefs

pkgname=fuse-${_p}-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A FUSE-based fault injection filesystem."
arch=(x86_64 aarch64)
url="https://github.com/ligurio/unreliablefs"
license=(MIT)
depends=(fuse)
makedepends=(git cmake)
provides=(fuse-unreliablefs)
conflicts=(fuse-unreliablefs)
source=("${_p}::git+$url")
b2sums=(SKIP)

pkgver() {
	cd $_p
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_p
	cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S .
	make -C build
}

package() {
	cd $_p
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
