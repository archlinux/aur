# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Adam Perkowski <adas1per@protonmail.com>

# https://github.com/adamperkowski/PKGBUILDs

_name=display3d
pkgname="${_name}-git"
pkgver=0.2.3.r2.642764a
pkgrel=1
pkgdesc='CLI for rendering and animating 3D objects (bleeding-edge version)'
arch=('x86_64')
url="https://github.com/renpenguin/${_name}"
license=('MIT')
conflicts=("${_name}")
makedepends=('cargo')
depends=('gcc-libs')
makedepends=('git')

source=("${_name}::git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${_name}"
    git describe --tags --long | sed "s/^v//; s/\-/.r/;s/\-g/./"
}

prepare() {
    cd "${_name}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_name}"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${_name}"
    install -Dm0755 "target/release/${_name}" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

