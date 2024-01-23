# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r128.35225f9
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('custom')
depends=(
	alsa-lib
	avahi
	ffmpeg
	gcc-libs
	glibc
	nvidia-utils
	openssl
	opus
)

source=(
	"${pkgname%-git}::git+https://github.com/hgaiser/moonshine"
	"moonshine.service"
)
sha256sums=('SKIP'
            '564b02490e50d9d4fe2cf03e911dc5783e5d311e12155907a724361e56dfedf7')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 target/release/${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm755 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
