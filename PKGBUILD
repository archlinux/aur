# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=3.2.1
pkgrel=1
pkgdesc='Adobe Font Development Kit for OpenType'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('custom')
# Note many of these are actually python-fonttools deps, but [community] package has them marked as optional
_py_deps=('booleanoperations' 'brotli' 'cu2qu' 'fontmath' 'fontparts' 'fontpens' 'fs' 'lxml' 'mutatormath' 'ufonormalizer' 'ufoprocessor' 'zopfli')
depends=('python' 'psautohint' "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6525fdb2745428f6cf61ef14e82cfbf9252b821ac8a90f9ad32ce96e6211d218')

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
