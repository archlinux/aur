# Maintainer: D7OMDEV <hello@d7om.dev>
#
pkgname=clipse-gui
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple clipboard manager with a GUI"
arch=('x86_64')
url="https://github.com/d7omdev/clipse-gui"
license=('MIT')
depends=('python' 'python-pip' 'gtk3' 'nuitka' 'wl-clipboard')
makedepends=('git' 'python-pipx')
source=("git+https://github.com/d7omdev/clipse-gui.git")
sha256sums=('SKIP')

# Prepare the source
prepare() {
	cd "$srcdir/$pkgname" || exit
}

build() {
	cd "$srcdir/$pkgname" || exit

	# Ensure pipx is available
	if ! command -v pipx &>/dev/null; then
		echo "pipx not found, installing pipx..."
		python -m pip install --user pipx
	fi

	# Run nuitka with pipx
	echo "Building the standalone binary using Nuitka..."
	pipx run nuitka --standalone --output-dir=dist --remove-output --include-package=clipse_gui --include-package=gi --include-module=gi._gi --include-module=gi._propertyhelper --include-module=gi._constants --include-module=gi._signalhelper --include-module=gi._enum --include-module=gi._error --include-module=asyncio clipse-gui.py
}

package() {
	cd "$srcdir/$pkgname" || exit

	# Install the built binary and related files
	install -Dm755 "$srcdir/$pkgname/dist/clipse-gui.bin" "$pkgdir/usr/local/bin/clipse-gui"
	install -Dm644 "$srcdir/$pkgname/clipse-gui.desktop" "$pkgdir/usr/share/applications/clipse-gui.desktop"
	install -Dm644 "$srcdir/$pkgname/clipse-gui.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/clipse-gui.png"

	# Create directories for necessary assets
	install -d "$pkgdir/usr/local/share/clipse-gui"
	install -m755 "$srcdir/$pkgname/dist/clipse-gui.bin" "$pkgdir/usr/local/share/clipse-gui/clipse-gui"
}

# Clean up temporary build files
clean() {
	rm -rf "$srcdir/$pkgname/dist" "$srcdir/$pkgname/build" "$srcdir/$pkgname/__pycache__"
}
