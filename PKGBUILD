# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko
pkgver=3.2.0
pkgrel=3
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('custom')
# Note many of these are actually python-fonttools deps, but [community] package has them marked as optional
_py_deps=('booleanoperations' 'brotli' 'cu2qu' 'fontmath' 'fontparts' 'fontpens' 'fs' 'lxml' 'mutatormath' 'ufonormalizer' 'ufoprocessor' 'zopfli')
depends=('python' 'psautohint' "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/adobe-type-tools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('eab4a8f8826261d35a2752b01ad4f7d101aec18fb407b9ac42aca16a1e27bec4')

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
    install -Dm644  -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
