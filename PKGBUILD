# Maintainer: faazuthnar
# Contributor: éclairevoyant
# Contributor: Atif Chowdhury <iftakhar dot awal at gmail dot com>

_pkgname=eww
pkgname="$_pkgname-tray-wayland-git"
pkgver=r30.aae214f
pkgrel=1
pkgdesc="ElKowar's wacky widgets (ralismark's fork) (Wayland build with systray support)"
arch=('x86_64')
url="https://github.com/ralismark/eww"
license=('MIT')
depends=(gtk3 gtk-layer-shell libdbusmenu-glib libdbusmenu-gtk3)
makedepends=(git rustup)
provides=("$_pkgname=${pkgver/.r*/}")
conflicts=("eww")
install=$pkgname.install
source=("git+$url.git#branch=tray-3")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	#git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

    # we increment the version with each commit since the fork
    printf "r%s.%s" "$(git rev-list --count HEAD ^e489c10559fef84729776a89329bdbf53b1807a4)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd $_pkgname
    # we don't automatically install the latest nightly, as the source tree specifies which toolchain it wants to use
	#rustup toolchain install nightly

	cargo build --release --no-default-features --features=wayland
}

package() {
	cd $_pkgname

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"

	install -d "$pkgdir/etc/xdg/$_pkgname/"
	cp -r examples/eww-bar "$pkgdir/etc/xdg/$_pkgname/"
}
