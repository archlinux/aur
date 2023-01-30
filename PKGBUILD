# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-fontparts-git
pkgver=0.11.0.r1.gf5250dc
pkgrel=1
pkgdesc='The replacement for RoboFab'
url='https://github.com/robotools/fontParts'
license=('MIT')
arch=(any)
_pydeps=(booleanoperations
         defcon
         fontmath
         fontpens # for defcon[pens]
         fonttools
         fs # for fonttools[ufo]
         lxml # for fonttools[lxml]
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python -m build -wn
}

check() {
    cd "$pkgname/Lib"
    PYTHONPATH=. python "fontParts/fontshell/test.py"
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

