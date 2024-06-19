# Maintainer: stein.cadwal@proton.me
pkgname=vterm-git
pkgver=r11.bbf8e18
pkgrel=1
pkgdesc="A cross platform, vulkan terminal emulator written in rust (git development version)"
arch=('x86_64')
url="https://github.com/nuIIpointerexception/vterm"
license=('MPL-2.0')
depends=(
	"gcc-libs"
	"glibc"
)
makedepends=(
	"git"
	"cargo"
	"rustup"
	"vulkan-headers"
	"just"
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	rustup override set nightly
}

build() {
	cd "$srcdir/${pkgname}"
	just build
}

check() {
	cd "$srcdir/${pkgname}"
	just test
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/$CARCH-unknown-linux-gnu/release/vterm"
	install -Dm644 "assets/linux/vterm.desktop" "$pkgdir/usr/share/applications/vterm.desktop"
}
