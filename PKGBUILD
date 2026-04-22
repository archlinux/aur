# Maintainer: jaoppb <joaopedroperes06@gmail.com>
pkgname=cranky-git
pkgver=0.3.0.rX.gYYYYYYY
pkgrel=1
pkgdesc="A minimalist, performant, and modular bar for Hyprland (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jaoppb/cranky"
license=('MIT' 'Apache')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'dbus')
optdepends=('uwsm: for systemd session management')
makedepends=('cargo' 'pkg-config' 'git')
provides=('cranky')
conflicts=('cranky')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "0.3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	cargo test --frozen
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/cranky" "${pkgdir}/usr/bin/cranky"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/cranky/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cranky/LICENSE"


	install -Dm644 "contrib/systemd/cranky.service" "${pkgdir}/usr/lib/systemd/user/cranky.service"
	install -Dm644 "contrib/systemd/cranky-uwsm.service" "${pkgdir}/usr/lib/systemd/user/cranky-uwsm.service"
}
