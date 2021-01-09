# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools-git
pkgver=0.6.1.r0.g5c76b41
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=('any')
url="https://github.com/googlefonts/${pkgname%-git}"
license=('Apache')
_py_deps=('babelfont'
          'brotli'
          'pybrowserstack-screenshots'
          'fontmake'
          'fonttools'
          'glyphslib'
          'opentype-sanitizer'
          'pygit2'
          'pyaml'
          'requests'
          'strictyaml'
          'tabulate'
          'ttfautohint-py'
          'unidecode'
          'fs' # optdepends of fonttols required for [ufo]
          'protobuf'
          'pygithub'
          'vttlib')
depends=('absl-py'
         'python'
         "${_py_deps[@]/#/python-}"
         'statmake')
makedepends=('python-setuptools-scm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # TODO: Drop tag hack when upstream fixes their releases, see:
    # https://github.com/googlefonts/gftools/issues/197
    git tag | grep -Fxq v0.3.14 || git tag v0.3.14 6e6a19a
    git describe --long --abbrev=7 --match 'v*' --tags |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
