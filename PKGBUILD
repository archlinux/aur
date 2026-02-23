# Maintainer: Lyra Vhess <auxilliary.email@protonmail.com>
pkgname=vsrvrt-git
_pkgname=vs-rvrt
pkgver=1.1.3
pkgrel=2
pkgdesc="Vapoursynth plugin for RVRT (Recurrent Video Restoration Transformer) video restoration"
arch=('x86_64')
url="https://github.com/Lyra-Vhess/vs-rvrt"
license=('CC-BY-NC-4.0')
depends=(
    'python-pytorch-cuda'
    'python-torchvision'
    'python-numpy'
    'python-requests'
    'python-tqdm'
    'python-einops'
    'python-packaging'
    'vapoursynth'
)
makedepends=(
    'git'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'ffmpeg: for video encoding/decoding'
)
provides=('vsrvrt')
conflicts=('vsrvrt')
source=("git+https://github.com/Lyra-Vhess/vs-rvrt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    local _pyver=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

    pip download --no-cache-dir --no-deps --only-binary=:all: \
        --python-version "$_pyver" --implementation cp --abi none \
        --platform manylinux2014_x86_64 vsrvrt

    local _wheel=$(ls vsrvrt-*.whl 2>/dev/null | head -1)
    if [[ -z "$_wheel" ]]; then
        error "Pre-built wheel not found on PyPI for Python ${_pyver}"
        return 1
    fi
}

package() {
    cd "$_pkgname"

    python -m installer --destdir="$pkgdir" vsrvrt-*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

post_install() {
    echo "Downloading RVRT model weights (~200MB)..."
    vsrvrt-download || {
        echo "ERROR: Failed to download model weights"
        return 1
    }
}

post_upgrade() {
    post_install
}
