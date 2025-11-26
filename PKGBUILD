# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: aereaux <aidan@jmad.org>

pkgname=meli-git
pkgver=0.8.10.r160.g8fc885d
pkgrel=1
pkgdesc='A MUA for the terminal aiming for configurability and extensibility with sane defaults'
arch=(x86_64)
url=https://meli.delivery
license=(GPL-3.0-only)
depends=(dbus-glib
         gcc-libs
         glibc)
makedepends=(cargo
             git
             mandoc)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+https://git.meli.delivery/meli/meli.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags --abbrev=7 --tags HEAD |
		sed 's/^\(pre\)\?-\?\(v\|alpha\|beta\|rc\)\?-\?//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	cargo build --frozen --release --features dbus-notifications,jmap
}

check() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --features dbus-notifications,jmap
}


package() {
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" meli/docs/meli.1
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli.conf.5
	install -Dm0644 -t "$pkgdir/usr/share/man/man5/" meli/docs/meli-themes.5
}
