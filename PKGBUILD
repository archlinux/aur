# Maintainer:
# Contributor: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=rusticon-git
_name=${pkgname%-git}
pkgver=0.2.3.r1.ge2ece1a
pkgrel=2
pkgdesc='A mouse driven SVG favicon editor for your terminal'
arch=(armv7h aarch64 i686 riscv64 x86_64)
url="https://github.com/ronilan/$_name"
license=(CC-BY-NC-ND-4.0)
depends=(glibc libgcc)
makedepends=(cargo git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd $_name
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd $_name
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

package() {
    cd $_name
    install -Dm755 target/release/$_name -t "$pkgdir/usr/bin"
}
