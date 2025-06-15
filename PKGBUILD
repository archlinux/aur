# Maintainer: Orestis Floros <orestisf1993@gmail.com>
# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=rofi-git
pkgver=1.7.9.1.r2.g4bcbe12c
pkgrel=1
pkgdesc='A window switcher, run dialog and dmenu replacement'
arch=('x86_64')
url='https://github.com/DaveDavenport/rofi/'
license=('MIT')
depends=(
	'bash'
	'cairo'
	'flex'
	'freetype2'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'hicolor-icon-theme'
	'libjpeg'
	'librsvg'
	'libx11'
	'libxcb'
	'libxdg-basedir'
	'libxft'
	'libxkbcommon'
	'libxkbcommon-x11'
	'pango'
	'startup-notification'
	'xcb-imdkit'
	'xcb-util'
	'xcb-util-cursor'
	'xcb-util-keysyms'
	'xcb-util-wm'
	'xcb-util-xrm'
)
makedepends=('git' 'meson' 'wayland-protocols')
checkdepends=('check')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=(
	'git+https://github.com/DaveDavenport/rofi#branch=next'
	'git+https://github.com/sardemff7/libgwater'
	'git+https://github.com/sardemff7/libnkutils'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${pkgname/-git/}"

	git describe --long --tags |
		sed 's/-/.r/;s/-/./'
}

prepare() {
	cd "${pkgname/-git/}"
	git submodule init
	git config submodule.subprojects/libgwater.url "${srcdir}/libgwater"
	git config submodule.subprojects/libnkutils.url "${srcdir}/libnkutils"
	git -c protocol.file.allow=always submodule update
	cd "${srcdir}"
}

build() {
	arch-meson "${pkgname/-git/}" --buildtype release --prefix /usr -Db_lto=true build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"

	cd "${pkgname/-git/}"
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname/-git/}/COPYING"
	install -Dm 755 Examples/*.sh -t "${pkgdir}/usr/share/doc/${pkgname/-git/}/examples"
}
