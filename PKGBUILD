# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r283.143e76c
pkgrel=2
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake libc++ rust)
depends=(
	avahi
	gamescope
	gcc-libs
	glib2
	glibc
	gstreamer
	gst-plugins-base-libs
	libevdev
	libpulse
	openssl
	opus
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
	"${pkgname%-git}::git+https://github.com/hgaiser/moonshine"
	"moonshine.service"
	"60-moonshine.rules"
)
sha256sums=('SKIP'
            '76dc912babb520eb6657199917caee3390e0f224e6062a964a461f724e68ae1d'
            'e896e8e448441f9b4a5c57def2b4ba15e9d03bf533eaa1133a77bbbf5004612e')

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
	install -Dm644 "$srcdir/60-moonshine.rules" "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
}
