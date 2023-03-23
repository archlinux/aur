# Maintainer: Justine Smithies
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-wayland-unsigned-git"
pkgver=0.4.0.r21.g45154bb
pkgrel=1
pkgdesc="ElKowar's wacky widgets (Wayland build)"
arch=('x86_64')
url="https://github.com/elkowar/eww"
license=('MIT')
depends=(gtk3 gtk-layer-shell)
makedepends=(git rustup)
provides=("$_pkgname=${pkgver/.r*/}")
conflicts=(eww eww-git eww-wayland-git)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	rustup toolchain install nightly
	cargo +nightly build --release --no-default-features --features=wayland
}

package() {
	cd $_pkgname

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"

	install -d "$pkgdir/etc/xdg/$_pkgname/"
	cp -r examples/eww-bar "$pkgdir/etc/xdg/$_pkgname/"
}
