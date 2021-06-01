# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=evcxr_jupyter
pkgver=0.10.0
pkgrel=1
pkgdesc='A Jupyter Kernel for the Rust programming language.'
url="https://github.com/google/evcxr/tree/master/$pkgname"
arch=('x86_64')
license=('Apache')
depends=('rust' 'jupyter-notebook')
makedepends=('cargo' 'cmake')
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('5550b0dbea97b970b692ebefdf027d5d7982f49e40bb8781707bb03b1a371f86')

build()
{
    cd "$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$pkgname-$pkgver"

    install --mode 755 --directory "$pkgdir/usr/bin"
    install --mode 755 "target/release/$pkgname" "$pkgdir/usr/bin"

    JUPYTER_PATH="$pkgdir/usr/share/jupyter/" cargo run --release -- --install
    sed -i 's#".*/target/release/evcxr_jupyter"#"/usr/bin/evcxr_jupyter"#' "$pkgdir/usr/share/jupyter/kernels/rust/kernel.json"
}
