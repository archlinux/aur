# Maintainer: RiverOnVenus <error@zhui.dev>

pkgname=python-dbgpu-git
_pkgname=dbgpu
pkgver=r22.c8f30ad
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
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
provides=("python-${_pkgname}=${pkgver}")
conflicts=("python-${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    # setup.py reads version from this file, but it's not tracked in git
    printf "%s" "$(git describe --tags --always 2>/dev/null || git rev-parse --short HEAD)" \
        > src/dbgpu/version.txt
}

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
