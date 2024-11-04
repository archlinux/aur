# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pysylph
pkgname=python-${_name}
pkgver=0.1.1
pkgrel=1
pkgdesc="PyO3 bindings and Python interface to sylph, an ultrafast method for containment ANI querying and taxonomic profiling."
url="https://github.com/althonos/pysylph"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=("MIT")
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-maturin' 'cargo')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
noextract=()
sha256sums=('9b9f4110e2d18d019e7897da8df383a73adb39cbed1a0c5dac9793ea37a7560e')

prepare() {
    cargo fetch --manifest-path "${srcdir}/${_name}-${pkgver}/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
