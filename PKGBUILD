# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-fedora
_pkgname=gnome-terminal
pkgver=3.18.2
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
license=('GPL')
depends=('vte3-notification>=0.42.1' 'gsettings-desktop-schemas' 'dconf' 'gtk3')
makedepends=('gnome-doc-utils' 'intltool' 'itstool' 'docbook-xsl' 'desktop-file-utils'
             'libnautilus-extension' 'appdata-tools' 'gnome-shell' 'gconf' 'vala' 'yelp-tools')
options=('!emptydirs')
url='https://www.gnome.org'
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	'0001-build-Don-t-treat-warnings-as-errors.patch'
	'gnome-terminal-symbolic-new-tab-icon.patch'
	'gnome-terminal-dark-transparency-notify.patch'
	'org.gnome.Terminal.gschema.override'
)
sha256sums=(
	'5e35c0fa1395258bab83952cfabe4c1828b8655bcd761f8faed70b452bd89efa'
	'83c42ed513e374c181b23da4f9fce39e197c1e09ae328147b2b2bcdfbc4c99d7'
	'5a3d70ffca64e81f10ede0ed222199581bfb8e92bec26d89dc86130243f8994d'
	'18e2f9530e759707775162a0207e782072a202f5c5efbbfe16079c6985eb37d9'
	'e2797c0591e45b7cf4e7e8d3b926803bcff129d88dfe3b54f63dc61e0c8377de'
)

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i '../0001-build-Don-t-treat-warnings-as-errors.patch'
	patch -p1 -i '../gnome-terminal-symbolic-new-tab-icon.patch'
	patch -p1 -i '../gnome-terminal-dark-transparency-notify.patch'

	autoreconf -f -i
}

build() {
	cd "${_pkgname}-${pkgver}"
	./configure --prefix=/usr \
	            --sysconfdir=/etc \
	            --localstatedir=/var \
	            --libexecdir=/usr/lib/${_pkgname} \
	            --disable-static \
	            --disable-gterminal \
	            --disable-migration \
	            --with-gtk=3.0 \
	            --with-nautilus-extension
	make
}

check() {
	cd "${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 '../org.gnome.Terminal.gschema.override' "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.Terminal.gschema.override"
}
