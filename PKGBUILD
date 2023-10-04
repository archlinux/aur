# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-svdtools
pkgname=(python-svdtools svdtools-rust)
pkgver=0.3.3
pkgrel=1
epoch=
pkgdesc="Python package to handle vendor-supplied, often buggy SVD files."
arch=('any')
url="https://github.com/rust-embedded/svdtools"
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
sha256sums=('e8ec3f141595d355fe6f5c9ff6b45c098f22f1ba7ccf3614811cecf7e58f014a')
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
