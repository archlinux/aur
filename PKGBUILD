# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-svdtools
pkgname=(python-svdtools svdtools-rust)
pkgver=0.3.0
pkgrel=0
epoch=
pkgdesc="Python package to handle vendor-supplied, often buggy SVD files."
arch=('any')
url="https://github.com/stm32-rs/svdtools"
license=('MIT', 'Apache-2.0')
groups=()
makedepends=(python-build
      python-installer
      python-wheel
      rust)
optdepends=('svd2rust: Generate Rust register maps (`struct`s) from SVD files')
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip' '!lto')
install=
changelog=
source=("${pkgbase#python-}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('8d5c82a902f556909d3ca05f5a52ded96d86595f5ea838a586be7376e58b9fa3')
#validpgpkeys=()

package_python-svdtools() {
    pkgdesc+=" (python)"
    depends=(python
      python-black
      python-braceexpand
      python-flit
      python-isort)

    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    python -m build --wheel --no-isolation

    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_svdtools-rust() {
    pkgdesc+=" (rust)"
    depends=(cargo)

    cd "${srcdir}/${pkgbase#python-}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .

}
