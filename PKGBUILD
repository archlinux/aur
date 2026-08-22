# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
pkgname=nispor
pkgver=2.0.2
pkgrel=3
pkgdesc='Unified interface for Linux network state querying'
arch=('x86_64')
url='https://github.com/nispor/nispor'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'Cargo.lock')
sha256sums=('ed7da27df6dbf5d16a8de99de3b9a42090d25d2b427d1082e672bc4d32a5f11f'
            '0c01ebfef85edcebbc835e1c3519ca35e2e099a6495c02a0ddd8b954ec74ad1a')

prepare() {
    cd "$pkgname-$pkgver"
    cp ../Cargo.lock .
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/npc "$pkgdir/usr/bin/npc"
}
