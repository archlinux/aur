# Maintainer: Louis Rannou <louis.rannou@semalibre.com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Benjamin Chrétien <chretien+aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=rofi-nox-git
pkgver=2.0.0.r83.ga8569d52
pkgrel=1
pkgdesc='A window switcher, run dialog and dmenu replacement. A copy of rofi-git without X support.'
arch=('any')
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
	'libjpeg-turbo'
	'librsvg'
	'libxdg-basedir'
	'libxkbcommon'
	'pango'
	'startup-notification'
	'wayland'
)
makedepends=('git' 'meson' 'wayland-protocols')
checkdepends=('check')
provides=("${pkgname/-nox-git/}" 'rofi-wayland')
conflicts=("${pkgname/-nox-git/}")
replaces=('rofi-wayland')
source=(
	'git+https://github.com/DaveDavenport/rofi#branch=next'
	'git+https://github.com/sardemff7/libgwater'
	'git+https://github.com/sardemff7/libnkutils'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${pkgname/-nox-git/}"

	git describe --long --tags |
		sed 's/-/.r/;s/-/./'
}

prepare() {
	cd "${pkgname/-nox-git/}"
	git submodule init
	git config submodule.subprojects/libgwater.url "${srcdir}/libgwater"
	git config submodule.subprojects/libnkutils.url "${srcdir}/libnkutils"
	git -c protocol.file.allow=always submodule update
	cd "${srcdir}"
}

build() {
	arch-meson "${pkgname/-nox-git/}" --buildtype release --prefix /usr -Db_lto=true -Dxcb=disabled build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"

	cd "${pkgname/-nox-git/}"
	install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname/-git/}/COPYING"
	install -Dm 755 Examples/*.sh -t "${pkgdir}/usr/share/doc/${pkgname/-git/}/examples"
}
