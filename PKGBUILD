# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tortuise-git
_pkgname=tortuise
pkgver=0.1.1.r16.ga3c41d2
pkgrel=1
pkgdesc='Gaussian splats in your terminal.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/buildoak/tortuise'
license=('MIT')
makedepends=('cargo' 'git' 'patch')
provides=('tortuise')
conflicts=('tortuise')
source=("$_pkgname::git+$url.git#branch=main"
    'fix-demo-path.patch')
sha256sums=('SKIP'
            'b76693d78f2cd87cdca87b0d8b06ac39d17eeb16f30110ccfb4a0576de56af9c')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    patch -p1 < ../fix-demo-path.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 target/release/tortuise "$pkgdir/usr/bin/tortuise"
    install -d "$pkgdir/usr/share/tortuise/"
    cp -r scenes/ "$pkgdir/usr/share/tortuise/" 
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
