# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r212.8b03f0e
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(git rust)
depends=(
	avahi
	cuda
	ffmpeg
	gcc-libs
	glibc
	libpulse
	nvidia-utils
	openssl
	opus
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
	"${pkgname%-git}::git+https://github.com/hgaiser/moonshine"
	"moonshine.service"
)
sha256sums=('SKIP'
            '90ebbbf2ce620910a9d594f8f5174d20401ae16e6abdc04210a926674a3da43d')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/moonshine/target/release/moonshine" "$pkgdir/usr/bin/moonshine"
	install -Dm755 "$srcdir/moonshine/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
