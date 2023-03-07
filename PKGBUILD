# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-wayland-git"
pkgver=0.4.0.r20.g8ff4142
pkgrel=1
pkgdesc="ElKowar's wacky widgets (Wayland build)"
arch=('x86_64')
url="https://github.com/elkowar/eww"
license=('MIT')
depends=(gtk3 gtk-layer-shell)
makedepends=(git rustup)
provides=("$_pkgname=${pkgver/.r*/}")
conflicts=("eww")
install=$pkgname.install
source=("git+$url.git?signed")
b2sums=('SKIP')
validpgpkeys=(
	'B558974128820CB473BD9807E321AD71B1D1F27F' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub (web-flow commit signing) <noreply@github.com>
)

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
