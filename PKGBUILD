# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='inputmodule-rs'
pkgname='python-inputmodule'
pkgver='0.2.0'
_commit='d9f18afb31d00a294e7bbb7395e2226b213b6733'
pkgrel='5'
pkgdesc='Python-based command line utility and library to control Framework Laptop 16 input modules'
arch=('any')
url="https://github.com/FrameworkComputer/$_projectname"
license=('MIT')
depends=('inputmodule-udev' 'python>=3.7.0' 'python-getkey' 'python-opencv' 'python-pillow' 'python-pygame' 'python-pyserial' 'tk')
makedepends=('imagemagick' 'python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer' 'python-wheel')
provides=("ledmatrixctl=$pkgver" "ledmatrixgui=$pkgver")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('bf6dc302db4440c9de4109fe47e02fb8997d2b09eee8b9ea375daf74e9e79c42e07ba497e46cc5b53c7b82385689eb293a74f16f7268344ad8754adcb44f2cba')

_sourcedirectory="$_projectname-$_commit/python"

prepare() {
	cd "$srcdir/$_sourcedirectory/../res/"

	# Create a PNG version of the icon
	magick 'framework_startmenuicon.ico' 'framework_startmenuicon.png'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_checkoutput="$(python -c 'from inputmodule.cli import main_cli; main_cli()' --help)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'Display a string on the LCD Display$'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/ledmatrixgui.desktop"
[Desktop Entry]
Name=ledmatrixgui
Exec=ledmatrixgui
Icon=ledmatrixgui
Type=Application
Categories=System;Utility;
EOF

	install -Dm644 '../res/framework_startmenuicon.png' "$pkgdir/usr/share/pixmaps/ledmatrixgui.png"

	install -Dm644 '../LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
