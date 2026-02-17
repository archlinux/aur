# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-east-asian-spacing-git
pkgver=1.4.5.r7.g6dd1e59
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
             'python-hatchling'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname
    python tests/download_fonts.py
    PYTHONPATH="$PWD" pytest
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
