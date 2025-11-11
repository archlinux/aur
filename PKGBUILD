# Maintainer: Christian Bardey (Nordwin) <hcmb [at] mailbox [dot] org>

pkgname=mailweb
pkgver=0.2.1
pkgrel=1
pkgdesc='Exports HTML emails to folders together with their embedded content.'
url='https://codeberg.org/jarkko/mailweb'
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=(glibc gcc-libs)
arch=('x86_64' 'aarch64')
source=("${pkgname}.tar.gz::https://codeberg.org/jarkko/mailweb/archive/${pkgver}.tar.gz")
sha256sums=('38f944fee85148ce45572de79d0b04b45ba802d93f2fecc5c1626c34cb5d5cb0')

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

# No tests
#check() {
#    cd $pkgname
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
