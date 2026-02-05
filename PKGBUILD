# Maintainer: aqwek
# Contributor: éclairevoyant 
# Contributor: Benoit Pierre <benoit dot pierre at gmail dot com>
# Contributor: Pyrrha

pkgname=plover
pkgdesc="Free and open source real-time stenography engine"
pkgver=5.0.0
_pkgver=5.0.0
pkgrel=1
_branchname='simplify-build-system-requires'
arch=(any)
url="https://www.openstenoproject.org/plover/"
license=(GPL2)
depends=(
	dbus
	python
	python-appdirs
	python-cmarkgfm
	python-evdev
	'python-plover_stroke>=1.1.0'
	'pyside6>=6.9.0'
	python-pkginfo
	python-psutil
	python-pyserial
	python-readme-renderer
	python-requests-cache
	python-requests-futures
	python-rtf_tokenize
	python-wcwidth
	python-xlib
	qt6-svg  # Updated to Qt6
)
makedepends=(
	python-babel
	python-build
	python-installer
	python-wheel
	qt6-base # Added to ensure uic/rcc binaries exist
)
source=(
	"$pkgname-$_branchname.tar.gz::https://github.com/openstenoproject/$pkgname/archive/refs/heads/$_branchname.tar.gz"
)
b2sums=(
	'SKIP'
)

prepare() {
	# Create shims that call Qt6 host tools with Python generators.
	mkdir -p "$srcdir/_tools"

	# pyside6-uic shim: redirects to the system's Qt6 uic tool
	cat > "$srcdir/_tools/pyside6-uic" <<'EOF'
#!/bin/sh
set -e
UIC=""
[ -x /usr/lib/qt6/uic ] && UIC=/usr/lib/qt6/uic
[ -z "$UIC" ] && [ -x /usr/lib/qt6/libexec/uic ] && UIC=/usr/lib/qt6/libexec/uic
[ -z "$UIC" ] && UIC="$(command -v uic6 || command -v uic || true)"
[ -z "$UIC" ] && { echo "uic not found" >&2; exit 127; }
exec "$UIC" -g python "$@"
EOF
	chmod +x "$srcdir/_tools/pyside6-uic"

	# pyside6-rcc shim: redirects to the system's Qt6 rcc tool (for resource files)
	cat > "$srcdir/_tools/pyside6-rcc" <<'EOF'
#!/bin/sh
set -e
RCC=""
[ -x /usr/lib/qt6/rcc ] && RCC=/usr/lib/qt6/rcc
[ -z "$RCC" ] && [ -x /usr/lib/qt6/libexec/rcc ] && RCC=/usr/lib/qt6/libexec/rcc
[ -z "$RCC" ] && RCC="$(command -v rcc6 || command -v rcc || true)"
[ -z "$RCC" ] && { echo "rcc not found" >&2; exit 127; }
exec "$RCC" -g python "$@"
EOF
	chmod +x "$srcdir/_tools/pyside6-rcc"
}

build() {
	cd "$pkgname-$_branchname"
	# Add the shim directory to the PATH for the build process
	export PATH="$srcdir/_tools:$PATH"
	python -m build -wn
}


package() {
	cd "$pkgname-$_branchname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -vDm644 plover/assets/$pkgname.png -t "$pkgdir/usr/share/pixmaps/"
	install -vDm644 linux/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
}
