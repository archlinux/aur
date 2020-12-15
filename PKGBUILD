# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko-git
pkgver=3.6.0a0.r0.g1e6c3c5
pkgrel=1
pkgdesc='Adobe Font Development Kit for OpenType'
arch=('x86_64')
url="https://github.com/adobe-type-tools/${pkgname%-git}"
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
depends=('python' 'psautohint>=2.2.0' "${_py_deps[@]/#/python-}")
makedepends=('git' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    # Upstream develop branch doesn't reparent to master with tags :(
    git tag -f 3.4.0 6874081 2>&1 >/dev/null ||:
    git describe --long --abbrev=7 --tags --match="[0-9]*" HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd "${pkgname%-git}"
    sed -i -e 's/==/>=/g;s/,<=[0-9.]\+//' requirements.txt
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
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
