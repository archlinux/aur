pkgname=hypr-dock-git
pkgver=v1.1.1.r51.g09f7802
pkgrel=1
pkgdesc="Interactive Dock Panel for Hyprland (does not provide hypr-alttab)"
arch=('x86_64')
url="https://github.com/lotos-linux/hypr-dock"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell')
makedepends=('git' 'go' 'make')
provides=("hypr-dock")
conflicts=("hypr-dock")
source=("hypr-dock::git+$url")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
	cd hypr-dock
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd hypr-dock
	git checkout main
}

build() {
	cd hypr-dock
	make build
}

package() {
	cd hypr-dock
	install -Dm755 "bin/hypr-dock" "$pkgdir/usr/bin/hypr-dock"

	# package configs so .install script can access them later
	install -d "$pkgdir/usr/share/hypr-dock/configs"
	cp -r configs/* "$pkgdir/usr/share/hypr-dock/configs/"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
