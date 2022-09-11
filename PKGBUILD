# Maintainer:   echo -n 'TWF0dCBDLiA8bWF0dEBnZXRjcnlzdC5hbD4='     | base64 -d
# Contributor:  echo -n 'YXh0bG9zIDxheHRsb3NAZ2V0Y3J5c3QuYWw+'     | base64 -d
# Contributor:  echo -n 'TWljaGFsIFMuIDxtaWNoYWxAZ2V0Y3J5c3QuYWw+' | base64 -d

pkgname=amethyst
pkgver=3.6.0
pkgrel=1
pkgdesc='A fast and efficient AUR helper'
arch=('x86_64' 'aarch64')
url="https://github.com/crystal-linux/$pkgname"
license=('GPL3')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')
depends=(
    'git' 
    'binutils' 
    'fakeroot' 
    'pacman-contrib' 
    'vim' 
    'expac' 
    'less'
)
makedepends=('cargo')

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
