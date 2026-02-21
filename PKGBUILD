# Maintainer: Lyra Vhess <auxilliary.email@protonmail.com>
pkgname=vsrvrt-git
_pkgname=vs-rvrt
pkgver=1.1.1.r0.8d94249
pkgrel=1
pkgdesc="Vapoursynth plugin for RVRT (Recurrent Video Restoration Transformer) video restoration"
arch=('x86_64')
url="https://github.com/Lyra-Vhess/vs-rvrt"
license=('CC-BY-NC-4.0')
depends=(
    'python'
    'python-einops'
    'python-torchvision'
    'python-numpy'
    'python-requests'
    'python-tqdm'
    'vapoursynth'
    'python-packaging'
)
optdepends=(
    'cuda: For GPU acceleration'
    'ffmpeg: For video encoding/decoding'
)
makedepends=('git' 'python-pip')
provides=('vsrvrt')
conflicts=('vsrvrt')
source=("git+https://github.com/Lyra-Vhess/vs-rvrt.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    rm -f vsrvrt-*.whl
    _pyver=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    pip download --no-cache-dir --no-deps --only-binary=:all: --python-version "${_pyver}" --implementation cp --abi none --platform "manylinux2014_x86_64" vsrvrt || {
        echo "ERROR: Pre-built wheel not found on PyPI for Python ${_pyver}"
        return 1
    }
}

package() {
    cd "$_pkgname"
    pip install --no-cache-dir --root="$pkgdir" --ignore-installed --no-deps vsrvrt-*.whl
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
