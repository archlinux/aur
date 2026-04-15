# Maintainer: D7OMDEV <hello@d7om.dev>
pkgname=clipse-gui
pkgver=0.7.0
pkgrel=25
pkgdesc="A GTK3 GUI for the clipse clipboard manager"
arch=('any')
url="https://github.com/d7omdev/clipse-gui"
license=('MIT')
depends=(
	'python'
	'python-gobject'
	'gtk3'
	'wl-clipboard'
	'wtype'
	'xdotool'
	'clipse'
)
makedepends=('git')
source=("git+https://github.com/d7omdev/clipse-gui.git")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$pkgname" || exit

	# Install Python sources — no Nuitka bundle. System python-gobject stays
	# in sync with system GLib, avoiding the frozen-gi assertion crashes that
	# affected 0.6.0 (#13) and 0.7.0 (#14).
	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -r clipse_gui "$pkgdir/usr/share/$pkgname/"
	install -Dm644 "$pkgname.py" "$pkgdir/usr/share/$pkgname/$pkgname.py"

	# Launcher shim
	install -dm755 "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec python "/usr/share/$pkgname/$pkgname.py" "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"

	# Icon
	if [ -f "$pkgname.png" ]; then
		install -Dm644 "$pkgname.png" \
			"$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	fi

	# License
	if [ -f "LICENSE" ]; then
		install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi

	# Systemd user service for the clipse listener
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/clipse.service" <<EOF
[Unit]
Description=Clipse clipboard listener
PartOf=graphical-session.target

[Service]
ExecStart=/usr/bin/clipse -listen
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF

	# Desktop entry
	install -dm755 "$pkgdir/usr/share/applications"
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=$pkgver
Type=Application
Name=Clipse GUI
GenericName=Clipboard Manager
Comment=GTK Clipboard Manager
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Categories=Utility;GTK;
StartupNotify=true
StartupWMClass=org.d7om.ClipseGUI
EOF
}
