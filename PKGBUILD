# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tortuise
pkgver=0.1.1
pkgrel=1
pkgdesc='Gaussian splats in your terminal.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/buildoak/tortuise'
license=('MIT')
makedepends=('cargo')
provides=('tortuise')
conflicts=('tortuise-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'fix-demo-path.patch')
sha256sums=('e48d388823512bdaad4801736e8b9966141dfb2cea353e43f6885e9267377d42'
            'b76693d78f2cd87cdca87b0d8b06ac39d17eeb16f30110ccfb4a0576de56af9c')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../fix-demo-path.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/tortuise "$pkgdir/usr/bin/tortuise"
    install -d "$pkgdir/usr/share/tortuise/"
    cp -r scenes/ "$pkgdir/usr/share/tortuise/" 
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
