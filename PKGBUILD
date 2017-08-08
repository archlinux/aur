# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.24.2
pkgrel=1
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification' 'gsettings-desktop-schemas' 'dconf' 'gtk3' 'glib2')
makedepends=('pkg-config' 'gnome-doc-utils' 'intltool' 'itstool' 'docbook-xsl' 
             'desktop-file-utils' 'libnautilus-extension' 'appdata-tools' 'gnome-shell' 
			 'gconf' 'vala' 'yelp-tools')
optdepends=('gconf: for gnome-terminal-migration'
			'libnautilus-extension: for "Open Terminal Here" in GNOME Files')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
groups=('gnome')
# Fedora patches: http://pkgs.fedoraproject.org/cgit/rpms/gnome-terminal.git/tree/
_frepourl='http://pkgs.fedoraproject.org/rpms/gnome-terminal'
_frepobranch='f26'
_fcommit='2744f1268183790484a978702ff19c57a67dc5fe'
_fpatchfile1='0001-build-Don-t-treat-warnings-as-errors.patch'
_fpatchfile2='gnome-terminal-notify-open-title-transparency.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	"${_fpatchfile1}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile1}"
	"${_fpatchfile2}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile2}"
	"${_fgsoverridefile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fgsoverridefile}"
)
sha256sums=('281edac30a07ca45beaaaf0a13fe2219cf8b87ece5e55dccbfc49ef769dfec0f'
            '83c42ed513e374c181b23da4f9fce39e197c1e09ae328147b2b2bcdfbc4c99d7'
            '913fb47ae222478fa40a8d162bef8b07d7f2a88c43fb254029df6844b58aaf64'
            '5409b35d1940443d29d810de0560d3303eb74c009e661e8fbfa1030e5ffde92e')

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i "../${_fpatchfile1}-${_fcommit}"
	patch -p1 -i "../${_fpatchfile2}-${_fcommit}"

	autoreconf -fvi
}

build() {
	cd "${_pkgname}-${pkgver}"
	./configure --prefix='/usr' \
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
