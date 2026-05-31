# Maintainer: RiverOnVenus <error@zhui.dev>

pkgname=python-dbgpu
_pkgname=dbgpu
pkgver=2025.12
pkgrel=1
pkgdesc="Open source database of 2000+ GPUs with architecture, manufacturing, API support and performance details"
arch=('any')
url="https://github.com/painebenjamin/dbgpu"
license=('MIT')
depends=(
    'python>=3.8'
    'python-click'
    'python-pydantic'
    'python-thefuzz'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
provides=(
    "python-${_pkgname}=${pkgver}"
    "python-${_pkgname}-git=${pkgver}"
)
conflicts=("python-${_pkgname}-git")
# Upstream does not track data.pkl in git; it is published as a GitHub release asset.
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${_pkgname}-${pkgver}.pkl::${url}/releases/download/${pkgver}/${pkgver//./-}.pkl"
)
sha256sums=(
    'ee1061f1f9ea1bd5b2c73fbea75a816da5b2beaac54e135bb0499232953baf06'
    '47022d504c177a5d21b2c92ce751861153b4a97a1e7804368b1e5af42122dbab'
)

prepare() {
    cd "${_pkgname}-${pkgver}"
    # setup.py reads version from version.txt, but it's not tracked in git
    printf "%s" "${pkgver}" > src/dbgpu/version.txt

    # Copy the pre-built database to where setup.py expects it
    cp "$srcdir/${_pkgname}-${pkgver}.pkl" src/dbgpu/data.pkl
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
