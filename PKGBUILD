# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=python-jsrc
pkgver=0.3.1
pkgrel=2
pkgdesc="Python library for bioinformatics and scientific computing"
arch=('any')
url="https://github.com/imjiaoyuan/jsrc"
license=('MIT')
depends=('python>=3.10' 'python-numpy>=1.23' 'python-matplotlib>=3.5' 'python-opencv>=4.7')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools>=61.0' 'uv')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('138e4664221830ce5023340cfcf49edbc97d94235ef53a0e05dd3a3d459fb0ec')

build() {
    cd "jsrc-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "jsrc-$pkgver"

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    python -m installer --destdir="$pkgdir" dist/*.whl

    uv pip install --python /usr/bin/python3 --target="$pkgdir$site_packages" --no-deps --no-binary biopython biopython>=1.80

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
