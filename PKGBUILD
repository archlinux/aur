# Maintainer: David Borzek <dev@davidborzek.de>

pkgname=i3-rounded-border-patch-git
pkgver=4.22.r31.gd06f97c4
pkgrel=1
pkgdesc='An improved dynamic tiling window manager'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3-gaps' 'i3-gaps-next-git')
groups=('i3' 'i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
	'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
	'libxkbcommon-x11')
makedepends=('git' 'bison' 'flex' 'asciidoc' 'xmlto' 'meson')
optdepends=('i3lock: For locking your screen.'
	'i3status: To display system information with a bar.')
options=('docs')
source=('git+https://github.com/i3/i3#branch=next' 'rounded-border.patch')
sha1sums=('SKIP' 'SKIP')

prepare() {
	cd "$srcdir/i3"
	patch --forward --strip=1 --input="../rounded-border.patch"
}

pkgver() {
	cd "$srcdir/i3"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "i3"
	arch-meson \
		-Ddocs=true \
		-Dmans=true \
		../build
	meson compile -C ../build
}

package() {
	cd "i3"
	DESTDIR="${pkgdir}" meson install -C ../build

	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:set ts=2 sw=2 et:
