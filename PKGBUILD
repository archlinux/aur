# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-east-asian-spacing-git
pkgver=1.4.4.r4.g4a7e5d3
pkgrel=1
pkgdesc="East Asian Contextual Spacing Build Tools"
arch=('any')
url="https://github.com/kojiishi/east_asian_spacing"
license=('Apache-2.0')
depends=('python'
         'python-fonttools'
         'python-brotli'
         'python-zopfli'
         'python-uharfbuzz')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel'
             'python-poetry-core')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$pkgname-$pkgver::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname-$pkgver
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    python tests/download_fonts.py
    PYTHONPATH="$PWD" pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
