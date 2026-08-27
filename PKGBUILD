# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
pkgname=nss-docker-ng
pkgver=1.2.1
pkgrel=1
pkgdesc="NSS plugin for resolving Docker containers by ID or name"
arch=('x86_64')
url="https://github.com/petski/nss-docker-ng"
license=('MIT')
depends=(
    'glibc'
    'gcc-libs'
)
makedepends=(
    'git'
    'cargo'
    'patchelf'
)
optdepends=(
    'docker: local container engine daemon'
)
options=(!lto)
_tag=6de1ad4eca82599323f437e5fb077bd7538326a5 # git rev-parse "v$pkgver"
source=("git+${url}.git#tag=${_tag}")
sha256sums=('4e6bb7b9c3055a9a678463b765ecd07d81eb399c2246531a7ed560f9133fc6e1')

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$(pwd)/.cargo"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$(pwd)/.cargo"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    patchelf --set-soname libnss_docker_ng.so.2 target/release/libnss_docker_ng.so
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/libnss_docker_ng.so" "$pkgdir/usr/lib/libnss_docker_ng.so.2"
    ln -sf libnss_docker_ng.so.2 "$pkgdir/usr/lib/libnss_docker_ng.so"
    install -Dm644 "LICENSE"   -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
