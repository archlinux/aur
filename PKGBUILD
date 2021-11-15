# Maintainer: Max Jöhnk <maxjoehnk@gmail.com>
pkgname=sidenotes-git
pkgver=r30.6adb925
pkgrel=1
pkgdesc='Show todos from different sources in a sidebar like app'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/maxjoehnk/sidenotes"
license=('GPL3')
groups=()
depends=('gtk3' 'curl')
makedepends=('git' 'cargo-nightly')
provides=('sidenotes')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"

    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${pkgname%-VCS}"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/sidenotes"
}
