# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=lamzu-cfg
pkgname="$_pkgname-git"
pkgver=r56.51c0879
pkgrel=1
pkgdesc="Lamzu mouse configuration tool"
arch=('x86_64')
url="https://github.com/LeadSun/lamzu-cfg"
source=("git+$url")
license=('MIT OR Apache-2.0')
provides=("$_pkgname")
conflicts=(lamzu-cfg)
sha256sums=('SKIP')

depends=(libgcc glibc systemd-libs)
makedepends=(cargo git)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 target/release/lamzu "$pkgdir"/usr/bin/lamzu-cfg
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/${pkgname}/License-Apache-2.0"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/${pkgname}/License-MIT"
}
