# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=3.6.0
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
          'fonttools>=4.18.2'
          'fs' # for fonttools
          'lxml'
          'tqdm'
          'ufonormalizer>=0.5.2'
          'ufoprocessor'
          'unicodedata2' # for fonttools
          'zopfli') # for fonttools
depends=('python' 'psautohint>=2.2.0' "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c79309faa12e5c7d201bc39359c2cf3103d704b7cbf2751190344e95b9f768bd')

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
