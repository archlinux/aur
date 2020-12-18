# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fontmake-git
pkgver=2.3.0.r0.g8705253
pkgrel=1
pkgdesc='Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)'
url="https://github.com/googlefonts/fontmake"
license=('MIT')
arch=('x86_64')
checkdepends=('python-pytest')
_py_depends=('cu2qu'
             'defcon'
             'fonttools>=4.18.1'
             'fontmath'
             'glyphslib'
             'mutatormath'
             'ufolib2'
             'ufo2ft>=2.19.1')
depends+=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools-scm')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

check() {
    cd "$pkgname"
    PYTHONPATH=Lib pytest tests
}

package() {
    cd "$pkgname"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D -m755 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

