# Maintainer: D7OMDEV <hello@d7om.dev>
pkgname=clipse-gui
pkgver=0.9.0
pkgrel=3
pkgdesc="A GTK3 GUI for the clipse clipboard manager"
arch=('any')
url="https://github.com/d7omdev/clipse-gui"
license=('MIT')
depends=(
	'python'
	'python-gobject'
	'gtk3'
	'gtk-layer-shell'
	'wl-clipboard'
	'wtype'
	'xdotool'
	'clipse'
)
makedepends=(
	'git'
	'python-build'
	'python-pip'
	'python-setuptools'
	'python-wheel'
)
source=("git+https://github.com/d7omdev/clipse-gui.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname" || exit
	# Build a standard wheel. No isolation: use the system's setuptools/wheel
	# instead of pulling fresh copies from PyPI in a sealed venv.
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname" || exit

	# Install wheel into the package root via pip. python-installer breaks on
	# Python 3.14 (rejects scripts as "outside target directory"); pip resolves
	# script paths through sysconfig and works correctly.
	pip install --no-deps --no-build-isolation --ignore-installed --root="$pkgdir" --prefix=/usr dist/*.whl

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
