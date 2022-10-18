# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=color-scheme-monitor
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Monitor the system-wide color scheme and adapt unaware applications to it"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/color-scheme-monitor/"
license=(custom:0BSD)
groups=()
depends=(dbus systemd xdg-desktop-portal)
makedepends=(cargo sed)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mkhl/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('d6c93093fc68065cfce54fe80415db64c756c28392d0bdcb15aca6a96e6f2efd70e5ef0951e65b4c84b886f31da1f8cf0e97a3f69cf38f38b54059f912499640')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/" PREFIX=/usr LIBEXECDIR=/usr/lib ./install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
