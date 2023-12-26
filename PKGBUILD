# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-svdtools
pkgname=(python-svdtools svdtools-rust)
pkgver=0.3.8
pkgrel=1
epoch=
pkgdesc="Python package to handle vendor-supplied, often buggy SVD files."
arch=(any)
url="https://github.com/rust-embedded/svdtools"
license=('MIT', 'Apache-2.0')
groups=()
makedepends=(python-build
      python-installer
      python-wheel
      python-black
      python-braceexpand
      python-flit
      python-lxml
      python-isort
      python-pyaml
      cargo
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
sha256sums=('9036f0430f51c2cbad29df25dba7211795b19f308b4878cdc011ed97ea8875e5')
#validpgpkeys=()

package_python-svdtools() {
    pkgdesc+=" (python)"
    depends=(python
      python-black
      python-braceexpand
      python-flit
      python-lxml
      python-isort
      python-pyaml)
    arch=('any')

    cd "${srcdir}/${pkgbase#python-}-${pkgver}"
    python -m build --wheel --no-isolation

    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_svdtools-rust() {
    pkgdesc+=" (rust)"
    depends=(cargo)
    arch=(x86_64
      aarch64
      riscv64)

    cd "${srcdir}/${pkgbase#python-}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .

}
