# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=random-rs
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple CLI multitool'
url='https://github.com/one-d-wide/random-rs'
arch=('x86_64')
license=(GPL3)
provides=('random')
conflicts=('random')
depends=('gcc-libs')
makedepends=('git' 'rustup')

source=("git+$url.git?signed#tag=v$pkgver")
sha256sums=('SKIP')

_echo() {
	echo Running: $@
	$@
}

prepare() {
    cd "$pkgname"
	_echo rustup toolchain install nightly
	_echo rustup component add --toolchain nightly rust-src
	cat >>Cargo.toml <<EOF
[profile.filesize]
inherits = 'release'
opt-level = 's'
debug = false
lto = true
panic = 'abort'
incremental = false
codegen-units = 16
rpath = true
strip = 'symbols'
EOF
	_echo cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    _echo cargo +nightly build --frozen --target "$CARCH-unknown-linux-gnu" --profile filesize -Z build-std-features=panic_immediate_abort -Z build-std=std,panic_abort
}

package() {
    cd "$pkgname"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/filesize/$pkgname" -t "$pkgdir/usr/bin"
}

