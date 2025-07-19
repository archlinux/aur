# Maintainer: Rafael Carvalho <contact@rafaelrc.com>

pkgname=wayland-pipewire-idle-inhibit
pkgver=0.6.0
pkgrel=2
pkgdesc="Inhibit wayland idle when computer is playing sound"
arch=('x86_64')
url="https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit"
license=('GPL-3.0-only')
depends=(gcc-libs glibc libpipewire)
makedepends=(cargo clang wayland wayland-protocols)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99709841d92cddca7c4cb441b1490f4fc905c34b3fc0028ec208c3ea91215b2e')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENCE
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" wayland-pipewire-idle-inhibit.service
}

