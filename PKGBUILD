# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=3.4.0
pkgrel=1
pkgdesc='Adobe Font Development Kit for OpenType'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('custom')
_py_deps=('booleanoperations'
          'brotli' # for fonttools
          'cu2qu'
          'fontmath'
          'fontparts'
          'fontpens' # for defcon
          'fonttools>=4.8.1'
          'fs' # for fonttools
          'lxml'
          'mutatormath>=3.0.1'
          'ufonormalizer>=0.4.1'
          'ufoprocessor'
          'unicodedata2' # for fonttools
          'zopfli') # for fonttools
depends=('python' 'psautohint' "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0339fc4b48c0cc9d717b57643322b0b4e0928ed92b9afd9f717b0bb60e8464e5')

prepare () {
    cd "$pkgname-$pkgver"
    sed -i -e 's/==/>=/g;s/,<=[0-9.]\+//' requirements.txt
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    python setup.py test
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py -q install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644  -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
