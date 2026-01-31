# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=t
pkgname=${_UpstreamPkgName,,}-lang
pkgver=0.3.0
pkgrel=1
pkgdesc="Concise language for manipulating text"
arch=('x86_64')
url="https://github.com/alecthomas/$_UpstreamPkgName"
license=('MIT')
makedepends=('git' 'cargo')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('c790a5f697fb2081a621c1e55d756fd70be7b63cf44208c08664a00e021754e2')

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
