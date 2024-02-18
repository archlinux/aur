# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r130.342b2b8
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
            '3cf939836b683c428692c383ea43a27857c048c2625422cff3350e3ba43924a1')

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
	install -Dm644 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
