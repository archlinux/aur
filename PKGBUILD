# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Ivy Foster <iff@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Danny Bautista <aur at pyrolagus.de>

_pkgbase=bemenu
pkgbase=bemenu-git
pkgname=(bemenu-git bemenu-ncurses-git bemenu-x11-git bemenu-wayland-git)
pkgver=0.6.7.r1.g81b5091
pkgrel=2

# Wayland without wlroots is not supported.
# https://github.com/Cloudef/bemenu/issues/79#issuecomment-572867783
pkgdesc='Dynamic menu library and client program inspired by dmenu'
url='https://github.com/Cloudef/bemenu'
arch=(x86_64)
license=(GPL3 LGPL3)

makedepends=(libxinerama libxkbcommon ncurses pango wayland wayland-protocols wlroots scdoc)

source=(git+https://github.com/Cloudef/bemenu)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgbase"
	make PREFIX=/usr
}

package_bemenu-git() {
	depends=(bemenu-renderer-git)
	provides=(libbemenu-git bemenu)
	conflicts=('bemenu')

	cd "$_pkgbase"
	make DESTDIR="$pkgdir" PREFIX=/usr install-base install-docs
}

package_bemenu-ncurses-git() {
	pkgdesc='ncurses renderer for bemenu'
	provides=(bemenu-renderer-git bemenu-ncurses)
	conflicts=(bemenu-ncurses)
	depends=(libbemenu-git ncurses)

	cd "$_pkgbase"
	make DESTDIR="$pkgdir" PREFIX=/usr install-curses
}

package_bemenu-wayland-git() {
	pkgdesc='Wayland (wlroots-based compositors) renderer for bemenu'
	provides=(bemenu-renderer-git bemenu-wayland)
	conflicts=(bemenu-wayland)
	depends=(libbemenu-git libxkbcommon pango wayland)
	install=bemenu-wayland-git.install

	cd "$_pkgbase"
	make DESTDIR="$pkgdir" PREFIX=/usr install-wayland
}

package_bemenu-x11-git() {
	pkgdesc='X11 renderer for bemenu'
	provides=(bemenu-renderer-git bemenu-x11)
	conflicts=(bemenu-x11)
	depends=(libbemenu-git libxinerama pango)

	cd "$_pkgbase"
	make DESTDIR="$pkgdir" PREFIX=/usr install-x11
}
