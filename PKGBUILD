# Maintainer: Daniel Korbelainen <officialpand@gmail.com>
pkgname=sniptext
pkgver=0.1.0
pkgrel=1
pkgdesc="Screen capture OCR tool with adaptive ensemble recognition"
arch=('any')
url="https://github.com/dkorbelainen/sniptext"
license=('MIT')
depends=(
    'python>=3.8'
    'python-pip'
    'tesseract'
    'tesseract-data-eng'
)
optdepends=(
    'tesseract-data-rus: Russian language support'
    'tesseract-data-fra: French language support'
    'tesseract-data-deu: German language support'
    'tesseract-data-spa: Spanish language support'
    'tesseract-data-jpn: Japanese language support'
    'tesseract-data-chi_sim: Chinese Simplified language support'
    'slurp: Wayland screen selection'
    'grim: Wayland screenshot tool'
    'wl-clipboard: Wayland clipboard support'
    'maim: X11 screenshot tool'
    'xclip: X11 clipboard support'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1fab596e2c95f10ada2bf79733316f1001b2fa3876b432c25a133f777d2d427')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    # Install using pip
    PIP_CONFIG_FILE=/dev/null pip install --isolated \
        --root="$pkgdir" \
        --ignore-installed \
        --no-deps \
        dist/*.whl

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install desktop entry
    install -Dm644 sniptext.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
