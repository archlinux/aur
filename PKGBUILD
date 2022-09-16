# Maintainer:   echo -n 'TWF0dCBDLiA8bWF0dEBnZXRjcnlzdC5hbD4='     | base64 -d
# Contributor:  echo -n 'YXh0bG9zIDxheHRsb3NAZ2V0Y3J5c3QuYWw+'     | base64 -d
# Contributor:  echo -n 'TWljaGFsIFMuIDxtaWNoYWxAZ2V0Y3J5c3QuYWw+' | base64 -d

pkgname=ame
_pkgname=amethyst
pkgver=4.0.0
pkgrel=1
pkgdesc='A fast and efficient AUR helper'
arch=('x86_64' 'aarch64')
url="https://github.com/crystal-linux/$_pkgname"
license=('GPL3')
source=("$_pkgname-$pkgver-$pkgrel::git+$url#tag=v$pkgver")
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
    cd "$srcdir/$_pkgname-$pkgver-$pkgrel"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver-$pkgrel"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    export AMETHYST_CODENAME="Funky Fish"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_pkgname-$pkgver-$pkgrel"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
