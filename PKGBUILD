# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=gb-io
_module=gb_io
_minpy=37
pkgname=python-${_name}
pkgver=0.3.7
pkgrel=1
pkgdesc="A Python interface to gb-io, a fast GenBank parser and serializer written in Rust."
url="https://github.com/althonos/gb-io.py"
arch=('any')
license=("MIT")
depends=('python')
makedepends=('python-maturin' 'python-build' 'python-installer' 'cargo')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_module-$pkgver.tar.gz")
sha256sums=(ca1bdfa39e06a9e5a9d73f08579fc7396f28b10a0aafab50c1c3c921c611db93)

prepare() {
    cargo fetch --manifest-path "${srcdir}/${_module}-${pkgver}/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_module}-${pkgver}/dist/${_module}-${pkgver}-cp${_minpy}-abi3-linux_${machine}.whl"

    rm -rf "${srcdir}/env"
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    cd "${srcdir}/${_module}-${pkgver}"
    python -m unittest discover

    deactivate
}

package() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_module}-${pkgver}/dist/${_module}-${pkgver}-cp${_minpy}-abi3-linux_${machine}.whl"

    python -m installer --destdir="$pkgdir" "$whl"
    install -Dm644 ${srcdir}/${_module}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
