# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.22.1
pkgrel=2
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification>=0.46.1-2' 'gsettings-desktop-schemas' 'dconf' 'gtk3>=3.12.0' 'glib2>=2.42.0')
makedepends=('gnome-doc-utils' 'intltool' 'itstool' 'docbook-xsl' 'desktop-file-utils'
             'libnautilus-extension' 'appdata-tools' 'gnome-shell' 'gconf' 'vala' 'yelp-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
groups=('gnome')
# Fedora patches: http://pkgs.fedoraproject.org/cgit/rpms/gnome-terminal.git/tree/
_frepourl='http://pkgs.fedoraproject.org/cgit/rpms/gnome-terminal.git'
_frepobranch='f25'
_fpatchfile1='0001-build-Don-t-treat-warnings-as-errors.patch'
_fpatchfile2='gnome-terminal-notify-open-title-transparency.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	"${_fpatchfile1}::${_frepourl}/plain/${_fpatchfile1}?h=${_frepobranch}"
	"${_fpatchfile2}::${_frepourl}/plain/${_fpatchfile2}?h=${_frepobranch}"
	"${_fgsoverridefile}::${_frepourl}/plain/${_fgsoverridefile}?h=${_frepobranch}"
)
sha256sums=('b00752336eb22d6d9f10c863c166ac73dcbb2ce4b280abdc0c78337e261bb0d4'
            '83c42ed513e374c181b23da4f9fce39e197c1e09ae328147b2b2bcdfbc4c99d7'
            'da84d49aecd4ddfe1c23b8bb7496c4d74d49f811117f251b82c3d5bed098e112'
            '5409b35d1940443d29d810de0560d3303eb74c009e661e8fbfa1030e5ffde92e')

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i "../${_fpatchfile1}"
	patch -p1 -i "../${_fpatchfile2}"

	autoreconf -fvi
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

	install -Dm644 "../${_fgsoverridefile}" \
		"${pkgdir}/usr/share/glib-2.0/schemas/${_fgsoverridefile}"
}
