# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=whichllm-git
_pkgname=whichllm
pkgver=0.5.7.r13.g7abe2b4
pkgrel=1
pkgdesc="Auto-detect your hardware and rank local LLMs by what actually fits and performs best"
arch=('any')
url="https://github.com/Andyyyy64/whichllm"
license=('MIT')
install="${pkgname}.install"
depends=(
    'python>=3.11'
    'python-typer'
    'python-rich'
    'python-httpx'
    'python-psutil'
    'python-dbgpu'
    'python-thefuzz'
)
optdepends=(
    'python-nvidia-ml-py: NVIDIA GPU detection (pulls in nvidia-utils ~900MB)'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
