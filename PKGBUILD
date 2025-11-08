# Maintainer: Lina Roether <lina.roether@proton.me>

pkgname=niji-git
pkgver=0.4.0
pkgrel=4
pkgdesc="A customizable tool for theming linux systems"
url="https://github.com/lina-roether/niji"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
license=("GPL-3.0")
depends=("luajit")
makedepends=("cargo" "git" "jq")
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
	export RUST_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd niji

	# Install binary
	install -Dm755 target/release/niji -t "$pkgdir/usr/bin"

	# Install license
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"

	# Install shell completions
	install -Dm644 target/release/completions/_niji "${pkgdir}/usr/share/zsh/site-functions/_niji"
	install -Dm644 target/release/completions/niji.bash "${pkgdir}/usr/share/bash-completion/completions/niji"
	install -Dm644 target/release/completions/niji.fish "${pkgdir}/usr/share/fish/vendor_completions.d/niji.fish"

	# Install modules and themes
	mkdir -p "$pkgdir/usr/share/niji"
	cp -a assets/modules "$pkgdir/usr/share/niji/"
	cp -a assets/themes "$pkgdir/usr/share/niji/"
}
