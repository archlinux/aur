# Maintainer: Chibani <11yzyv86j@relay.firefox.com>

pkgname="ash-git"
pkgver=r469.9801ea1
pkgrel=1
pkgdesc="An immutable tree-shaped meta-distribution using snapshots."
url="https://github.com/ochibani/ash"
arch=("x86_64")
license=("AGPL")
depends=("btrfs-progs" "coreutils" "curl" "efibootmgr" "pacman" "paru" "python" "sed" "rc-local")
makedepends=("cargo" "git")
optdepends=("grub" "systemd")
provides=("ash")
conflicts=("ash")
source=("$pkgname::git+https://github.com/ochibani/ash.git")
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	git switch rust
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
	cargo build --release --locked --target-dir=target
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cd "$pkgname"
	install -Dm755 "target/release/ash" "${pkgdir}/usr/bin/ash"
}
