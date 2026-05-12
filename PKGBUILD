# Maintainer: Sinoosoida <sinoosoidapass@gmail.com>
pkgname=video-match-finder-git
_pkgname=video-match-finder
pkgver=0.1.0.r7.gebc77a0
pkgrel=1
pkgdesc="Partial near-duplicate video detection (DINOv2 + FAISS + Hough/permutation)"
arch=('any')
url="https://github.com/Sinoosoida/video-match-finder"
license=('MIT')
depends=(
    'python>=3.10'
    'ffmpeg'
    'python-pytorch'
    'python-torchvision'
    'python-numpy'
    'python-pillow'
    'python-psutil'
    'python-typer'
    'python-rich'
    'python-tqdm'
    'python-httpx'
    'faiss-cpu'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-pytorch-cuda: GPU inference (compute capability ≥ 7.5)'
    'python-fastapi: required for `vmf serve` embeddings endpoint'
    'uvicorn: required for `vmf serve` embeddings endpoint'
    'faiss-gpu: faster ANN search on supported NVIDIA GPUs'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # take base version from pyproject + commits since last tag (or first commit)
    local base
    base=$(grep -Po '^version = "\K[^"]+' pyproject.toml)
    printf "%s.r%s.g%s" "$base" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
