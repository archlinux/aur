# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.28.2
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification>=0.52.1' 'gsettings-desktop-schemas' 'dconf')
makedepends=('intltool' 'itstool' 'docbook-xsl' 'libnautilus-extension' 
             'appdata-tools' 'gnome-shell' 'gconf' 'vala' 'yelp-tools')
optdepends=('gconf: for gnome-terminal-migration'
			'libnautilus-extension: for "Open Terminal Here" in GNOME Files')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
groups=('gnome')
# Fedora patches: http://src.fedoraproject.org/cgit/rpms/gnome-terminal.git/tree/
_frepourl='http://src.fedoraproject.org/rpms/gnome-terminal'
_frepobranch='f28'
_fcommit='a829ffe3f4166069220c64b0bdcaae72bfe90cc7'
_fpatchfile1='0001-build-Don-t-treat-warnings-as-errors.patch'
_fpatchfile2='gnome-terminal-notify-open-title-transparency.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	"${_fpatchfile1}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile1}"
	"${_fpatchfile2}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile2}"
	"${_fgsoverridefile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fgsoverridefile}"
)
sha256sums=('a283dca4980eecf9184a55aac03fef99f85748461ff190423a2253f3b4557279'
            'f2bc35ec3e0230606ed424225cf8a8aad5149b59880fc4caf3db68a52f534986'
            '32d3f485a2f7b64d07ecc322c45be2889ed8e2431c783893ed6874c7a78d39f4'
            '5409b35d1940443d29d810de0560d3303eb74c009e661e8fbfa1030e5ffde92e')

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i "../${_fpatchfile1}-${_fcommit}"
	patch -p1 -i "../${_fpatchfile2}-${_fcommit}"

	autoreconf -fvi
}

build() {
	cd "${_pkgname}-${pkgver}"
	LDFLAGS+=" -pthread" ./configure --prefix='/usr' \
	            --sysconfdir='/etc' \
	            --localstatedir='/var' \
	            --libexecdir="/usr/lib/${_pkgname}" \
	            --disable-static \
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

	install -Dm644 "../${_fgsoverridefile}-${_fcommit}" \
		"${pkgdir}/usr/share/glib-2.0/schemas/${_fgsoverridefile}"
}
