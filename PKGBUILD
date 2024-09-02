# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=lightmotif
pkgname=python-${_name}
pkgver=0.9.0
_version=0.9.0.post2
pkgrel=1
pkgdesc="PyO3 bindings and Python interface to lightmotif, a library for platform-accelerated biological motif scanning using position weight matrices."
url="https://github.com/althonos/lightmotif"
arch=('any')
license=("MIT OR GPL-3.0-or-later")
groups=()
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cargo')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${_version}.tar.gz")
noextract=()
sha256sums=('b1702c99b0fdf43df574dedc5a10894d531d7998ec5f914f844181bff2cd4615')

prepare() {
    cargo fetch --manifest-path "${srcdir}/${_name}-${_version}/lightmotif-py/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${_name}-${_version}"
    python -m build --wheel --no-isolation
}

check() {
    local pyver=$(python -c 'import sys; print("{}{}".format(*sys.version_info[:2]))')
    local impl=$(python -c 'import platform; print(platform.python_implementation().lower())')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${_version}/build/lib.linux-${machine}-${impl}-${pyver}"
    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${_version}/dist/${_name}-${_version}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${_version}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
