pkgname=python-jsrc
pkgver=0.2.8
pkgrel=1
pkgdesc="Python library for bioinformatics and scientific computing"
arch=('any')
url="https://github.com/imjiaoyuan/jsrc"
license=('MIT')
depends=('python>=3.10' 'python-numpy>=1.23' 'python-matplotlib>=3.5' 'python-opencv>=4.7')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools>=61.0' 'uv')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('86962a7ad2e4744688ca3ec9294d5c6a9753968d360ca8cdadf17ced2fa4145f')

build() {
    cd "jsrc-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "jsrc-$pkgver"

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    python -m installer --destdir="$pkgdir" dist/*.whl

    uv pip install --target="$pkgdir$site_packages" --no-deps biopython>=1.80

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
