# Maintainer: Avery Warddhana <nullableVoidPtr+arch _ gmail>

pkgname=python-fx
pkgver=0.1.0
pkgrel=2
pkgdesc=" A python-native JSON Viewer TUI"
url='https://github.com/cielong/pyfx'
arch=('any')
license=('GPL2')
makedepends=('python-build' 'python-installer' 'python-wheel' 'antlr4')
checkdepends=('python-pytest')
depends=('python-antlr4' 'python-asciimatics' 'python-click'
		'python-dacite' 'python-first' 'python-jsonpath-ng'
		'python-loguru' 'python-overrides' 'python-pillow'
		'python-ply' 'python-pyfiglet' 'python-pyperclip'
		'python-yaml' 'python-urwid' 'python-wcwidth'
		'python3-yamale')
source=("${pkgname}-${pkgver}::git+https://github.com/cielong/pyfx.git#tag=v${pkgver}"
        '001-fix-version.patch')
sha256sums=('SKIP'
            'bfa4cc3b504b27e1483565154cf84aacdd70637aa754a21732f58ca460d4eedc')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/001-fix-version.patch"

    cd src/pyfx/model/common/jsonpath/
    antlr4 -Dlanguage=Python3 JSONPath.g4
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "${pkgname}-${pkgver}"
#     pytest
# }

package() {
    cd "${pkgname}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=4 sts=4:
