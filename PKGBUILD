# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=evcxr_jupyter
pkgver=0.5.0
pkgrel=1
pkgdesc='A Jupyter Kernel for the Rust programming language.'
url="https://github.com/google/evcxr/tree/master/$pkgname"
arch=('x86_64')
license=('Apache')
depends=('rust' 'jupyter-notebook')
makedepends=('cargo')
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('32183ff94cb0c1589fa4f9786ea7307ff6717ef998cba4d09d29b5b96a15b1b6')

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

    JUPYTER_CONFIG_DIR="$pkgdir/usr/share/jupyter/" cargo run --release -- --install
    sed -i 's#".*/target/release/evcxr_jupyter"#"/usr/bin/evcxr_jupyter"#' "$pkgdir/usr/share/jupyter/kernels/rust/kernel.json"
}
