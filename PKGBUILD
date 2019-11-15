# Maintainer: William Turner <willtur.will@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=afdko-git
pkgver=3.0.2a5.r47.323bebca
pkgrel=1
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('x86_64')
url="https://github.com/adobe-type-tools/${pkgname%-git}"
license=('custom')
_py_deps=('booleanoperations' 'cu2qu' 'fontparts' 'lxml' 'mutatormath' 'ufonormalizer' 'ufoprocessor')
depends=('python' 'psautohint' "${_py_deps[@]/#/python-}")
depends_x86_64=('lib32-glibc')
makedepends=('git' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/adobe-type-tools/${pkgname%-git}.git")
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
    python setup.py -q build
}

check() {
    cd "${pkgname%-git}"
    python setup.py test
}

package() {
    cd "${pkgname%-git}"
    python setup.py -q install --root="$pkgdir" --optimize=1
    install -D -m644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
