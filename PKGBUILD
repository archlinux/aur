# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=gb-io
_module=gb_io
pkgname=python-${_name}
pkgver=0.3.0
pkgrel=1
pkgdesc="A Python interface to gb-io, a fast GenBank parser and serializer written in Rust."
url="https://github.com/althonos/gb-io.py"
arch=('any')
license=("MIT")
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cargo')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(210e41ab8bf732883a242e78284c57ed3854829589559cb939dad757f652cb3b)

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
