# Maintainer: sudacode <suda@sudacode.com>
pkgname=python-manga-ocr
_pkgname=manga_ocr
pkgver=0.1.14
pkgrel=1
pkgdesc="A tool for extracting text from manga images using OCR"
arch=('x86_64')
url="https://github.com/kha-white/manga-ocr"
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-installer')
depends=(
    'python>=3.6'
    'python-fire'
    'python-fugashi'
    'python-jaconv'
    'python-loguru'
    'python-numpy'
    'python-pillow>=10.0.0'
    'python-pyperclip'
    'python-pytorch>=1.0'
    'python-transformers>=4.25.0'
    'python-unidic-lite'
)
optdepends=(
    'python-pytorch: GPU acceleration'
    'wl-clipboard: Read images from the clipboard in the command-line mode on Wayland'
    'xclip: Read images from the clipbaord in the command-line mode on X11'
)
checkdepends=('python-pytest')

conflicts=('manga-ocr-git')

source=(
    "https://github.com/kha-white/manga_ocr/archive/refs/tags/v${pkgver}.tar.gz"
    "skip-example-run-on-boot.patch"
)
sha256sums=('f7d73bbf482cbefb6f91ff3c628a3131d6c7dc863612539fe5d03a4b7d640643'
    'd287a2fbfa71d9753cdfd921ce67bd7bf1fcf1e36dd08fc00c8d142305d4da88')

prepare() {
    cd "${_pkgname//_/-}-$pkgver"
    patch --forward --strip=0 --input=../skip-example-run-on-boot.patch
}

build() {
    cd "${_pkgname//_/-}-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname//_/-}-$pkgver"
    pytest -o addopts=""
}

package() {
    cd "${_pkgname//_/-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
