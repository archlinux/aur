# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko-git
pkgver=3.2.0.r23.gbbedb0e
pkgrel=1
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('x86_64')
url="https://github.com/adobe-type-tools/${pkgname%-git}"
license=('custom')
# Note many of these are actually python-fonttools deps, but [community] package has them marked as optional
_py_deps=('booleanoperations' 'brotli' 'cu2qu' 'fontmath' 'fontparts' 'fontpens' 'fs' 'lxml' 'mutatormath' 'ufonormalizer' 'ufoprocessor' 'zopfli')
depends=('python' 'psautohint' "${_py_deps[@]/#/python-}")
makedepends=('git' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=($provides)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    # Upstream develop branch doesn't reparent to master with tags :(
    git tag -f 3.2.0 7fe7398 2>&1 >/dev/null ||:
    git describe --tags --abbrev=7 --match="[0-9]*" HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
