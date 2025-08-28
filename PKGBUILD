# Maintainer: D7OMDEV <hello@d7om.dev>
pkgname=clipse-gui
pkgver=0.3.2
pkgrel=3
pkgdesc="A simple clipboard manager with a GUI"
arch=('x86_64')
url="https://github.com/d7omdev/clipse-gui"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'wl-clipboard' 'wtype' 'xdotool')
makedepends=('git' 'python-pip' 'python-wheel' 'python-setuptools' 'clang' 'patchelf')
source=("git+https://github.com/d7omdev/clipse-gui.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname" || exit

	# Create and activate virtual environment
	python -m venv .venv
	source .venv/bin/activate

	# Install Nuitka and required dependencies
	pip install nuitka pygobject

	# Run Nuitka with maximum optimization for speed
	python -m nuitka --standalone --clang --output-dir=build --remove-output \
		--include-package=clipse-gui \
		--include-package=gi \
		--include-module=gi._gi \
		--include-module=gi._propertyhelper \
		--include-module=gi._constants \
		--include-module=gi._signalhelper \
		--include-module=gi._enum \
		--include-module=gi._error \
		--include-module=asyncio --jobs=$(nproc) clipse-gui.py

	# Build complete
	deactivate
}

package() {
	cd "$srcdir/$pkgname" || exit

	# Create necessary directories
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/$pkgname"
	install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	install -d "$pkgdir/usr/share/applications"

	# Check for the Nuitka binary and move it
	if [ -f "build/clipse-gui.dist/clipse-gui.bin" ]; then
		cp -r "build/clipse-gui.dist/." "$pkgdir/usr/share/$pkgname/"
		mv "$pkgdir/usr/share/$pkgname/clipse-gui.bin" "$pkgdir/usr/share/$pkgname/clipse-gui"
	else
		echo "Error: Binary file not found in build/clipse-gui.dist/."
		exit 1
	fi

	# Create symlink in bin
	ln -sf "/usr/share/$pkgname/clipse-gui" "$pkgdir/usr/bin/clipse-gui"

	# Install icon if it exists
	if [ -f "$pkgname.png" ]; then
		echo "Installing icon..."
		install -Dm644 "$pkgname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/clipse-gui.png"
	else
		echo "Warning: Icon file '$pkgname.png' not found."
	fi

	# Create desktop file
	echo "Creating .desktop file..."
	cat >"$pkgdir/usr/share/applications/clipse-gui.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Clipse GUI
GenericName=Clipboard Manager
Comment=GTK Clipboard Manager
Exec=/usr/bin/clipse-gui
Icon=clipse-gui
Terminal=false
Categories=Utility;GTK;
StartupNotify=true
StartupWMClass=org.d7om.ClipseGUI
EOF

	echo "$pkgname installation complete."
}

clean() {
	cd "$srcdir/$pkgname" || exit
	echo "Cleaning up..."
	make clean
}
