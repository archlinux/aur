# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.20.2
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification>=0.44.2' 'gsettings-desktop-schemas' 'dconf' 'gtk3>=3.12.0' 'glib2>=2.42.0')
makedepends=('gnome-doc-utils' 'intltool' 'itstool' 'docbook-xsl' 'desktop-file-utils'
             'libnautilus-extension' 'appdata-tools' 'gnome-shell' 'gconf' 'vala' 'yelp-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
install="${pkgname}.install"
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	'0001-build-Don-t-treat-warnings-as-errors.patch'
	'gnome-terminal-transparency-notify.patch'
	'org.gnome.Terminal.gschema.override'
)
sha256sums=(
	'f5383060730f1de70af35e917f82d5b6a14d963ad9cfd6a0e705f90011645a23'
	'83c42ed513e374c181b23da4f9fce39e197c1e09ae328147b2b2bcdfbc4c99d7'
	'34d2fb95873334dd79ff76dda6a69692b0f390e9ac1c9795052020e847a680ed'
	'5409b35d1940443d29d810de0560d3303eb74c009e661e8fbfa1030e5ffde92e'
)

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i '../0001-build-Don-t-treat-warnings-as-errors.patch'
	patch -p1 -i '../gnome-terminal-transparency-notify.patch'

	autoreconf -f -i
}

build() {
	cd "${_pkgname}-${pkgver}"
	./configure --prefix='/usr' \
	            --sysconfdir='/etc' \
	            --localstatedir='/var' \
	            --libexecdir="/usr/lib/${_pkgname}" \
	            --disable-static \
	            --disable-gterminal \
	            --disable-migration \
	            --with-gtk=3.0 \
	            --with-nautilus-extension
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

check() {
	cd "${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 '../org.gnome.Terminal.gschema.override' \
		"${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.Terminal.gschema.override"
}
