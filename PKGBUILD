# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=gb-io
_module=gb_io
pkgname=python-${_name}
pkgver=0.3.5
pkgrel=1
pkgdesc="A Python interface to gb-io, a fast GenBank parser and serializer written in Rust."
url="https://github.com/althonos/gb-io.py"
arch=('any')
license=("MIT")
depends=('python')
makedepends=('python-maturin' 'python-build' 'python-installer' 'cargo')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_module-$pkgver.tar.gz")
sha256sums=(8e7a959ebcbffda8d898c3fa6c6517c3957dac4b373c6edf1e058eefb756edde)

prepare() {
    cargo fetch --manifest-path "${srcdir}/${_module}-${pkgver}/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_module}-${pkgver}/dist/${_module}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    rm -rf "${srcdir}/env"
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    cd "${srcdir}/${_module}-${pkgver}"
    python -m unittest discover

    deactivate
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_module}-${pkgver}/dist/${_module}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"

    python -m installer --destdir="$pkgdir" "$whl"
    install -Dm644 ${srcdir}/${_module}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
