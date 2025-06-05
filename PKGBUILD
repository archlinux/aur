#Maintainer: crlcrl1 <crl18039102576@126.com>

_pkgname=pku3b
pkgname="$_pkgname"-git
pkgver=0.8.1.r3.g8f9f88d
pkgrel=1
pkgdesc="A Better Black Board for PKUers 🎓"
arch=('x86_64')
url="https://github.com/sshwy/pku3b"
license=('custom')
depends=(glibc gcc-libs)
makedepends=(cargo)
conflicts=(pku3b)
source=("git+$url.git")
sha256sums=('SKIP')
options=(!lto) # aws-lc-sys fails with lto

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
