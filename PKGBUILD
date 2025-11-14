# Maintainer: Lina Roether <lina.roether@proton.me>

pkgname=niji-git
pkgver=0.5.0
pkgrel=2
pkgdesc="A customizable tool for theming linux systems"
url="https://github.com/lina-roether/niji"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
license=("GPL-3.0")
depends=("luajit")
makedepends=("cargo" "just" "git" "jq")
provides=("niji")
conflicts=("niji")
source=("git+${url}.git"
        "git+https://github.com/vinceliuice/Colloid-gtk-theme.git")
md5sums=("SKIP" "SKIP")

pkgver() {
	cd niji
	cargo read-manifest --manifest-path=crates/niji/Cargo.toml | jq -r .version
}

prepare() {
	cd niji
	git submodule init
	git config submodule.colloid.url "$srcdir/Colloid-gtk-theme"
	git -c protocol.file.allow=always submodule update
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd niji
	just build
}

package() {
	cd niji
	just install "$pkgdir"
}
