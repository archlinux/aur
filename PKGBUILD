# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=lolcat-rs
pkgver=1.3.1
pkgrel=1
pkgdesc="The good ol' lolcat, now with fearless concurrency."
url='https://github.com/ur0/lolcat'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=(GPL3)
provides=('lolcat')
conflicts=('lolcat')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6eee67d2ceeb0443b5cbd285e320e8923c891fa0734815394339141b442a4d33')

prepare() {
    cd "lolcat-$pkgver"
    >Cargo.config
    if [[ "$(pacman -Qq rust)" == rust ]]; then
        echo Package rust installed: compile with dynamic linking
        echo -e '[build]\nrustflags = ["-C", "prefer-dynamic=yes"]' >Cargo.config
    fi
    cat >>Cargo.toml <<EOF
[profile.release]
opt-level = 's'
debug = false
incremental = false
strip = 'symbols'
EOF
    cargo fetch
}

build() {
    cd "lolcat-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --config Cargo.config
}

package() {
    cd "lolcat-$pkgver"
    install -Dm755 "target/release/lolcat" -t "$pkgdir/usr/bin"
}
