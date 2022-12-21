# Maintainer: bendn <bend.n@outlook.com>
# shellcheck disable=SC2148,SC2034

pkgname="godot-package-manager-git"
pkgrel=1
pkgver=0.5.0.r0.gef1917c
pkgdesc="A package manager for godot addons."
arch=('any')
url="https://github.com/godot-package-manager/client"
license=(APACHE)
conflicts=()
makedepends=(rust git)
depends=(gcc-libs)
optdepends=('godot: to use addons')
source=(
	LICENSE
	gpm::git+https://github.com/godot-package-manager/client
)
sha256sums=(3fddc139b1d6ed4cb530967f190bfbbd7f4a7f5c8ed968c57b1c7d2ae24ba14c SKIP)
provides=(godot-package-manager)
groups=(godot)

check() {
	echo -e '[packages]\n"@bendn/gdcli" = "1.2.5"' | ./gpm/target/release/godot-package-manager -c- update -lcheck.json
	jq -c . <check.json
	rm -r addons/@bendn/gdcli
	rm -r addons/
}

pkgver() {
	cd gpm &&
		git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd gpm &&
		cargo build -r
}

package() {
	cd gpm
	install -Dm755 target/release/godot-package-manager "$pkgdir/usr/bin/godot-package-manager"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
