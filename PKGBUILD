# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gnome-theme-manager
pkgname="$_pkgbase"
pkgver=2.0.beta
pkgrel=1
pkgdesc='Application designed to seamlessly browse, download, install, and apply GNOME themes and customizations directly from gnome-look.org'
arch=('x86_64')
url='https://github.com/unaibenidorm/Gnome-Theme-Manager'
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'polkit')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
_tag="${pkgver##*.}"
source=(
	"$_pkgbase::git+https://github.com/unaibenidorm/Gnome-Theme-Manager.git#tag=${_tag^}-${pkgver%.*}"
	"gnome-theme-manager-bin"
)
sha256sums=('efab5c647132512920845cdad906739e284fc5de5772d9c98fd7ef8cc11dbbcc'
            '93d3e7ac7ecd304e37b37487abae2d43880042116cc2a880c3160ffce811a4a5')

prepare() {
	git -C "$srcdir/$_pkgbase" clean -dfx
}

build() {
	cd "$_pkgbase"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgbase"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -d "$pkgdir/usr/share/$_pkgbase"
	install -Dm755 gnome-theme-manager.py "$pkgdir/usr/share/$_pkgbase/gnome-theme-manager.py"
	install -Dm755 "$srcdir/gnome-theme-manager-bin" "$pkgdir/usr/bin/$_pkgbase"
	install -Dm644 gnome-theme-manager.desktop "$pkgdir/usr/share/applications/$_pkgbase.desktop"

	sed -i \
		-e 's|^Exec=.*|Exec=gnome-theme-manager|' \
		-e 's|^Icon=.*|Icon=gnome-theme-manager|' \
		"$pkgdir/usr/share/applications/$_pkgbase.desktop"

	install -Dm644 gnome_theme_manager/gnome-theme-manager.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/gnome-theme-manager.svg"
}
