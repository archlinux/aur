# Maintainer: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-wayland-git"
pkgver=0.4.0.r21.g45154bb
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
source=("git+$url.git?signed"
        0001-remove-box_syntax.patch)
b2sums=('SKIP'
        '2953945ff2286fef89c5a08e834221b15900ef43c5422871e247ff5b6c13983f5c7a3869ae9dcc670809b10f921c6d4b822c77d07033bf36d7bf1d285589de20')
validpgpkeys=(
	'B558974128820CB473BD9807E321AD71B1D1F27F' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $_pkgname
	# pending merge of #711
	patch -Np1 -i ../0001-remove-box_syntax.patch
}

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
