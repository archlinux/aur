# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-svdtools
pkgname=(python-svdtools svdtools-rust)
pkgver=0.3.2
pkgrel=0
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
sha256sums=('05030af231f1d39f591bd37d5d21de4b40a077bc025b77901c27f643f29a80e7')
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
