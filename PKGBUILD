# Maintainer: Urpagin <dXJwYWdpbkBwcm90b24ubWUK>
# (The email is base64-encoded)

pkgname='slpcli-git'
pkgver='r63.484b39e'
pkgrel=3
pkgdesc="A Minecraft: Java Edition CLI Server List Ping implementation in C++."
arch=('x86_64')
url="https://github.com/Urpagin/slpcli"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja')
_asio_tag='1-34-2'
source=(
  "${pkgname%-git}::git+https://github.com/Urpagin/slpcli.git"
  "asio-${_asio_tag}.tar.gz::https://github.com/chriskohlhoff/asio/archive/refs/tags/asio-${_asio_tag}.tar.gz"
)
sha256sums=('SKIP' 'f3bac015305fbb700545bd2959fbc52d75a1ec2e05f9c7f695801273ceb78cf5')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 	cd "$srcdir/${pkgname%-git}"
 	mv "$srcdir/asio-asio-${_asio_tag}" "$srcdir/asio"
 	# Pull CLI11 repository
 	git submodule update --init
# 	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -S . -B build -G Ninja \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' \
	-DFETCHCONTENT_FULLY_DISCONNECTED=ON \
	-DFETCHCONTENT_SOURCE_DIR_ASIO="$srcdir/asio"
	cmake --build build --parallel
}

package() {
	cd "$srcdir/${pkgname%-git}"
	#cmake --install build --strip --prefix /usr
	DESTDIR="$pkgdir" cmake --install build --prefix /usr --strip
	install -Dm755 build/slpcli "$pkgdir/usr/bin/slpcli"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

}
