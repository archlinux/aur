# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=evcxr_jupyter
pkgver=0.15.0
pkgrel=1
pkgdesc='A Jupyter Kernel for the Rust programming language.'
url="https://github.com/google/evcxr/tree/main/$pkgname"
arch=('x86_64')
license=('Apache')
depends=('rust' 'jupyter-notebook')
makedepends=('cargo' 'cmake')
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('1220b7334b5de30284914218b1ff60604fb39945e22ded7063b477355840884b')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$pkgname-$pkgver"

    cargo build --frozen --release
}

package()
{
    cd "$pkgname-$pkgver"

    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 "target/release/$pkgname" "$pkgdir/usr/bin"

    JUPYTER_PATH="$pkgdir/usr/share/jupyter/" cargo run --release -- --install
    sed -i 's#".*/target/release/evcxr_jupyter"#"/usr/bin/evcxr_jupyter"#' "$pkgdir/usr/share/jupyter/kernels/rust/kernel.json"
}
