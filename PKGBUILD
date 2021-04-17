# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=evcxr_jupyter
pkgver=0.9.0
pkgrel=1
pkgdesc='A Jupyter Kernel for the Rust programming language.'
url="https://github.com/google/evcxr/tree/master/$pkgname"
arch=('x86_64')
license=('Apache')
depends=('rust' 'jupyter-notebook')
makedepends=('cargo' 'cmake')
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('b548744ca35f26412881e18e13e09f2c927e686764fd464f753a548ce15b48a2')

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
