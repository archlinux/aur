# Maintainer: VCalV
_pkgname=mergiraf
pkgname="${_pkgname}-git"
pkgver=0.5.1.r0.g720c974
pkgrel=1
pkgdesc="A syntax-aware git merge driver for a growing collection of programming languages and file formats"
arch=('x86_64')
url="https://mergiraf.org/"
license=('GPL-3.0-or-later')
makedepends=(cargo git)
checkdepends=(git)
depends=(glibc gcc-libs)
options=('!lto')
conflicts=("$_pkgname-bin" "$_pkgname")
provides=("$_pkgname")
source=("git+https://codeberg.org/mergiraf/mergiraf.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[^0-9]*//g'
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    #cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}


package() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    #cargo install --no-track --frozen --all-features --root "$pkgdir/usr/" --path .
    #cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    cargo install --no-track --offline --all-features --root "$pkgdir/usr/" --path .
    install -Dm444 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm444 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm444 GOVERNANCE.md "$pkgdir/usr/share/doc/$pkgname/GOVERNANCE.md"
}
