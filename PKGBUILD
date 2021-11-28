# Maintainer: Vojtech Lacina <anubhait at centrum dot cz>
pkgname=wayfire-shell-aur-git
pkgver=0.7.0
pkgrel=1
pkgdesc='Wayfire panel and background for wayfire-aur-git aur package'
arch=('x86_64')
url="https://wayfire.org"
license=(MIT)
conflicts=("$pkgname" wf-shell-git wf-shell)
depends=(wayfire-aur-git gtkmm3 gtk-layer-shell gobject-introspection libpulse wayland wayland-protocols)
makedepends=(meson ninja git)
source=("git+https://github.com/WayfireWM/wf-shell")
sha512sums=('SKIP')

pkgver () {
	cd "$srcdir/wf-shell"
	git tag -l|awk '/^[0-9.]+$/ {print $0} /^v{1}[0-9.]+$/ {print substr($0,2)}'|sort -n|tail -n1
}

build () {
	cd "$srcdir/wf-shell"
	arch-meson --buildtype=release -Dpulse=enabled build
}

package () {
	cd "$srcdir/wf-shell"
        DESTDIR="$pkgdir/" ninja -C build install
	install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}
