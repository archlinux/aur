# Maintainer: D7OMDEV <hello@d7om.dev>
pkgname=clipse-gui
pkgver=0.6.0
pkgrel=22
pkgdesc="A GTK3 GUI for the clipse clipboard manager"
arch=('x86_64')
url="https://github.com/d7omdev/clipse-gui"
license=('MIT')
depends=('python-gobject' 'gtk3' 'wl-clipboard' 'wtype' 'xdotool')
makedepends=('git' 'uv' 'gcc')
options=('!strip')
source=("git+https://github.com/d7omdev/clipse-gui.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname" || exit
	rm -rf dist/
	uv venv --python 3.13 .venv
	uv pip install nuitka PyGObject --python .venv/bin/python
	.venv/bin/python -m nuitka --onefile --output-dir=dist --remove-output \
		--include-package=clipse_gui \
		--follow-imports --nofollow-import-to=*.tests --assume-yes-for-downloads \
		"$pkgname.py"
	mv dist/clipse-gui.bin dist/clipse-gui
}

package() {
	cd "$srcdir/$pkgname" || exit

	rm -rf "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/opt/$pkgname"
	cp dist/clipse-gui "$pkgdir/opt/$pkgname"
	chmod +x "$pkgdir/opt/$pkgname/$pkgname"

	mkdir -p "$pkgdir/usr/bin"
	ln -sf "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

	if [ -f "$pkgname.png" ]; then
		install -Dm644 "$pkgname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	fi

	mkdir -p "$pkgdir/usr/share/applications"
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=$pkgver
Type=Application
Name=Clipse GUI
GenericName=Clipboard Manager
Comment=GTK Clipboard Manager
Exec=/opt/$pkgname/$pkgname
Icon=$pkgname
Terminal=false
Categories=Utility;GTK;
StartupNotify=true
StartupWMClass=org.d7om.ClipseGUI
EOF
}
