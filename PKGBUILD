# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='inputmodule-rs'
pkgname='python-inputmodule'
pkgver='0.2.0'
pkgrel='2'
pkgdesc='Python-based command line utility and library to control Framework Laptop 16 input modules'
arch=('any')
url="https://github.com/FrameworkComputer/$_projectname"
license=('MIT')
depends=('inputmodule-udev' 'python>=3.7.0' 'python-getkey' 'python-opencv' 'python-pillow' 'python-pyserial' 'python-pysimplegui')
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer' 'python-wheel')
provides=('ledmatrixctl' 'ledmatrixgui')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8664ff4aa73cda06e57c73c740d56f4f2d64b236b88c8cb1199e09703cad050c5b3693ed8b11de224c8b6689d0d7f01b57cbf150070b30aa00587332f6c406f6')

_sourcedirectory="$_projectname-$pkgver/python"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_checkoutput="$(python -B -m 'inputmodule.cli' --help)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'Display a string on the LCD Display$'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
	install -Dm644 '../LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
