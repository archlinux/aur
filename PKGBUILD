# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=lightmotif
pkgname=python-${_name}
pkgver=0.10.0
pkgrel=1
pkgdesc="PyO3 bindings and Python interface to lightmotif, a library for platform-accelerated biological motif scanning using position weight matrices."
url="https://github.com/althonos/lightmotif"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=("MIT OR GPL-3.0-or-later")
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cargo')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
noextract=()
sha256sums=(c4bd28f381fa64dfc84de0abfa690f5df2d9f7c50fd8f5d7bdf40ab702eaefc2)

prepare() {
    cargo fetch --manifest-path "${srcdir}/${_name}-${pkgver}/lightmotif-py/Cargo.toml" --target "$CARCH-unknown-linux-gnu"
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
    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
