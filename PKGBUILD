# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.1.6'
pkgrel='5'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD-3-Clause')
depends=('python>=3.6.0')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-remove-lock-usage.diff::$url/commit/cfe7600f37cee8f593d380037026857147b1eed6.diff"
)
b2sums=('c14d9109ec143f51281e1cf4b6d7940f83009738b8057d06714cf3da72b5006168ffad9735aaadc32091890cfeea9163a2c66d4a46317fd8f3d9879611ab034c'
        '0b2aa92097fa0e1959b63d10341ffa5921b90dcf6289d0e5361df0fd27d095ae332093c1a501aead8ac39c7c14bfed5a2a6295fbfe6d8e4555361f603564b1c2')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# https://github.com/jwlodek/py_cui/pull/188
	patch --forward -p1 < "../$pkgname-$pkgver-remove-lock-usage.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
