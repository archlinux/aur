# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-fedora
_pkgname=gnome-terminal
pkgver=3.20.0
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
license=('GPL')
depends=('vte3-notification>=0.44.0' 'gsettings-desktop-schemas' 'dconf' 'gtk3>=3.12.0' 'glib2>=2.42.0')
makedepends=('gnome-doc-utils' 'intltool' 'itstool' 'docbook-xsl' 'desktop-file-utils>=0.2.90'
             'libnautilus-extension' 'appdata-tools' 'gnome-shell' 'gconf' 'vala' 'yelp-tools')
options=('!emptydirs')
url='https://www.gnome.org'
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	'0001-build-Don-t-treat-warnings-as-errors.patch'
	'gnome-terminal-transparency-notify.patch'
	'org.gnome.Terminal.gschema.override'
)
sha256sums=(
	'2fe7f6bd3ca4e93ce156f83e673b9e8c3f0155b6bc603e109edc942718eb4150'
	'83c42ed513e374c181b23da4f9fce39e197c1e09ae328147b2b2bcdfbc4c99d7'
	'2e80e28a47639f751de5e3947e99b0d9bd8a7532bcfc5ac28dddad7e8e08ce3a'
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
	./configure --prefix=/usr \
	            --sysconfdir=/etc \
	            --localstatedir=/var \
	            --libexecdir=/usr/lib/${_pkgname} \
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
