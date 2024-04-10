# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=nafcodec
pkgname=python-${_name}
pkgver=0.2.0
pkgrel=1
pkgdesc="An encoder/decoder for Nucleotide Archive Format files."
url="https://github.com/althonos/nafcodec"
arch=('any')
license=("MIT")
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cargo')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(8194203409f9e0b7aa762530747da4db4dc4c19de0b8fb0419b894e89368e6b8)

prepare() {
    cargo fetch --manifest-path "${srcdir}/${_name}-${pkgver}/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local pyver=$(python -c 'import sys; print("{}{}".format(*sys.version_info[:2]))')
    local impl=$(python -c 'import platform; print(platform.python_implementation().lower())')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${pkgver}/build/lib.linux-${machine}-${impl}-${pyver}"
    python -c "import ${_module}"
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_module}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
