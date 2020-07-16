# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=3.5.0
pkgrel=1
pkgdesc='Adobe Font Development Kit for OpenType'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('custom')
_py_deps=('booleanoperations'
          'brotli' # for fonttools
          'fontmath'
          'fontparts'
          'fontpens' # for defcon
          'fonttools'
          'fs' # for fonttools
          'lxml'
          'mutatormath>=3.0.1'
          'ufonormalizer>=0.4.1'
          'ufoprocessor'
          'unicodedata2' # for fonttools
          'zopfli') # for fonttools
depends=('python' 'psautohint>=2.1.0' "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('93a11f7f708fd94c9a0d5f13f844b2e642fa0a7fd97bf5fa49a2f6050e252d72')

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
