# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyskani
pkgname=python-${_name}
pkgver=0.3.0
pkgrel=1
pkgdesc="PyO3 bindings and Python interface to skani, a method for fast fast genomic identity calculation using sparse chaining"
url="https://github.com/althonos/pyskani"
arch=('any')
license=("MIT")
makedepends=('python-build' 'python-installer' 'python-maturin' 'cargo')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(663114278d04c586c2684ce8111699884be1122bcef7d2e892a64886938e8e17)

prepare() {
    cargo fetch --manifest-path "${srcdir}/${_name}-${pkgver}/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp38-abi3-linux_${machine}.whl"

    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
    deactivate
}

package() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp38-abi3-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
