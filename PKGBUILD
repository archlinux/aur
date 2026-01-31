# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=t
pkgname=${_UpstreamPkgName,,}-lang
pkgver=0.2.0
pkgrel=2
pkgdesc="Concise language for manipulating text"
arch=('x86_64')
url="https://github.com/alecthomas/$_UpstreamPkgName"
license=('MIT')
makedepends=('git' 'cargo')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('a81d39edd186adff03033f17d5edecf148756e08ccebfb64266a6711416484bc')

prepare() {
    cd ${_UpstreamPkgName}
#   patch --forward --strip=1 --input="${srcdir}/py-version-updates.patch"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd ${_UpstreamPkgName}
    #refuses to work with clang
    export CC=gcc
    export CXX=g++
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd ${_UpstreamPkgName}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_UpstreamPkgName}"
}
