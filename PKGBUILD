# Maintainer: Topher Ludlow <topherludlow at protonmail dot com>
pkgname=rdb
pkgver=0.1.0
pkgrel=1
pkgdesc="Retrieval Database for Arch Wiki Documentation (GPU-accelerated)"
arch=('x86_64')
url="https://github.com/Topher2014/rdb"
license=('MIT')
depends=(
    'python'
    'python-pip'
    'python-requests'
    'python-beautifulsoup4'
    'python-lxml'
    'python-numpy'
    'python-pandas'
    'python-pytorch-cuda'
    'python-tqdm'
    'python-dotenv' 
    'python-click'
    'python-rich'
    'python-flask'
    'python-scikit-learn'
    'python-pillow'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'python-pytorch: CPU-only fallback (significantly slower)'
)
install=rdb.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-data-$pkgver.tar.gz::$url/releases/download/v$pkgver/rdb-data-v$pkgver.tar.gz")
sha256sums=('ab48967065efc5236b486971bbadeb8d9529ffafa285ae16e59cf7b6001fc4d6'
            '1b5df73254c1286922c8b29d090f5a36acc5b21a864e28aabd74abb7fb7fb097')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Extract data to the appropriate location
    tar -xf "$srcdir/$pkgname-data-$pkgver.tar.gz" -C .
    
    # Build the Python package
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    echo "Skipping checks - requires ML dependencies installed via pip"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
