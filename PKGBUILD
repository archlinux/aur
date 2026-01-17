# Maintainer: djwarf
pkgname=switchgen-git
pkgver=0.1.0
pkgrel=1
pkgdesc="AI Image Generator using ComfyUI as a library"
arch=('x86_64')
url="https://github.com/djwarf/switchgen"
license=('MIT')
depends=(
    'python>=3.10'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-pillow'
    'python-pytorch'
    'python-torchvision'
    'python-numpy'
    'python-scipy'
    'python-tqdm'
    'python-aiohttp'
    'python-yaml'
    'python-huggingface-hub'
    'python-einops'
    'python-transformers'
    'python-safetensors'
    'python-psutil'
    'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'git')
provides=('switchgen')
conflicts=('switchgen')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install bundled ComfyUI to /usr/share/switchgen/vendor/
    install -dm755 "$pkgdir/usr/share/switchgen/vendor"
    cp -r vendor/ComfyUI "$pkgdir/usr/share/switchgen/vendor/"

    # Install desktop file and docs
    install -Dm644 switchgen.desktop "$pkgdir/usr/share/applications/switchgen.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE" 2>/dev/null || true
}
