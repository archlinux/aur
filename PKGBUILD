# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-glyphslib-git
pkgver=6.1.0.r57.g416dcbf6
pkgrel=1
pkgdesc='A bridge from Glyphs source files (.glyphs) to UFOs'
url='https://github.com/googlefonts/glyphsLib'
license=('Apache-2.0')
arch=(any)
_pydeps=(fonttools
         fs # for fonttools[ufo]
         openstep-plist
         ufolib2
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-defcon
             python-setuptools-scm
             git)
_pycheckdeps=(lxml # for fonttools[lxml]
              pytest
              ufo2ft
              ufonormalizer
              xmldiff)
checkdepends=("${_pycheckdeps[@]/#/python-}")
optdepends=(python-defcon
            python-ufonormalizer)
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
    cd "$pkgname"
    PYTHONPATH=Lib pytest tests \
        --deselect tests/builder/interpolation_test.py \
        --deselect tests/builder/designspace_gen_test.py \
        --deselect tests/builder/builder_test.py
}

package() {
    cd "$pkgname"
    python -m installer -d "$pkgdir" dist/*.whl
}

