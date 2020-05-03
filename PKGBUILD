# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jason Edson <jaysonedson@gmail.com>

_pkgname='gnome-terminal'
pkgname="${_pkgname}-fedora"
pkgver=3.36.1.1
pkgrel=2
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Terminal'
license=('GPL')
depends=('vte3-notification>=0.60.2' 'gsettings-desktop-schemas' 'dconf')
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
_frepobranch='f32'
_fcommit='bb5f88b61f68a1bb0b1f1269dfb48eabfc35b5c0'
_fpatchfile1='0001-build-Don-t-treat-warnings-as-errors.patch'
_fpatchfile2='gnome-terminal-cntr-ntfy-autottl-ts.patch'
_fgsoverridefile='org.gnome.Terminal.gschema.override'
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/${_pkgname}-${pkgver}.tar.xz"
	"${_fpatchfile1}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile1}"
	"${_fpatchfile2}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fpatchfile2}"
	"${_fgsoverridefile}-${_fcommit}::${_frepourl}/raw/${_fcommit}/f/${_fgsoverridefile}"
)
sha256sums=('f3d708a1e76d77c1c85b126f6e003220a15d4a46a50fd8070e1a3aabe678a376'
            '672615edf1f8e5ede72bdfa2e671ad35d355a1df64f349762899ad7bc7254769'
            '8417a68521fd8bae432b5e9832321d95a296279fa4cdc64827520db552829cf5'
            'a4a22834d6524fb697a8edf91c9489617d5ab2e513413fc84c6b8575320938f9')

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
