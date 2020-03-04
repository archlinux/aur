# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko-git
pkgver=3.0.2a5.r47.323bebca
pkgrel=1
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('x86_64')
url="https://github.com/adobe-type-tools/${pkgname%-git}"
license=('custom')
# Note many of these are actually python-fonttools deps, but [community] package has them marked as optional
_py_deps=('booleanoperations' 'brotli' 'cu2qu' 'fontmath' 'fontparts' 'fontpens' 'lxml' 'mutatormath' 'ufonormalizer' 'ufoprocessor' 'zopfli')
depends=('python' 'psautohint' "${_py_deps[@]/#/python-}")
makedepends=('git' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=($provides)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare () {
    cd "${pkgname%-git}"
    sed -i -e 's/==/>=/g' requirements.txt
}

build() {
    cd "${pkgname%-git}"
    python setup.py build
}

check() {
    cd "${pkgname%-git}"
    python setup.py test
}

package() {
    cd "${pkgname%-git}"
    python setup.py -q install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644  -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
