# Maintainer: gcb <1705-gcb@users.noreply.gitlab.archlinux.org>
pkgname=dtui
pkgdesc='Small TUI for introspecting the state of the system/session dbus'
pkgver=3.0.1
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Troels51/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.tar.gz::git+https://github.com/Troels51/${pkgname}.git#tag=v${pkgver}")
sha256sums=('611e27a18750630025e29bcf5736d4b8ac57e8bba527c734b05623aecab99ed3')
pkgrel=1
arch=('x86_64')
url=https://github.com/Troels51/dtui
license=('MIT')
depends=() # dbus: application still only handle local bus...
makedepends=(cargo-audit) # NOTE: remember to `namcap PKGBUILD` and to build with `extra-x86_64-build -c -r /mnt/chroots/arch` in a clean chroot
optdepends=()

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$pkgname-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$srcdir/$pkgname-$pkgver"
	cargo audit
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$pkgname-$pkgver"
	cargo test --frozen --verbose --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 0755 target/release/dtui "${pkgdir}/usr/bin/${pkgname}"
	install -D -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m 0644 "$srcdir/$pkgname-$pkgver/LICENSE"
}

