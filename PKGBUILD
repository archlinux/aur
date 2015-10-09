# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-fedora
_pkgname=gnome-terminal
pkgver=3.18.0
pkgrel=2
pkgdesc='The GNOME Terminal Emulator with Fedora patches'
arch=('i686' 'x86_64')
license=('GPL')
depends=('vte3-notification' 'gsettings-desktop-schemas' 'dconf')
makedepends=('gnome-doc-utils' 'intltool' 'itstool' 'docbook-xsl' 'desktop-file-utils'
             'libnautilus-extension' 'appdata-tools' 'gnome-shell' 'gconf' 'vala' 'yelp-tools')
optdepends=('gconf: settings migration when upgrading from older version')
options=('!emptydirs')
url='https://www.gnome.org'
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=(
	"https://download.gnome.org/sources/${_pkgname}/${pkgver::4}/$_pkgname-${pkgver}.tar.xz"
	'0001-build-Don-t-treat-warnings-as-errors.patch'
	'gnome-terminal-symbolic-new-tab-icon.patch'
	'0001-notebook-Don-t-change-show-tabs-when-going-to-empty-.patch'
	'0001-window-Exit-early-from-screen-removed-handler-for-no.patch'
	'0001-window-Pass-tab-switching-keys-to-the-terminal-for-t.patch'
	'gnome-terminal-restore-dark-transparency.patch'
	'gnome-terminal-command-notify.patch'
	'org.gnome.Terminal.gschema.override'
)
sha256sums=(
	'776642502b57b7a6b5f099291b660c0b4a4ff2b3024d15a2f5b33c4286c9dce6'
	'83c42ed513e374c181b23da4f9fce39e197c1e09ae328147b2b2bcdfbc4c99d7'
	'5a3d70ffca64e81f10ede0ed222199581bfb8e92bec26d89dc86130243f8994d'
	'd6dbc0c09781d6a75604c7f01aa2554131bd00194c89d9a5fa33fa503587632e'
	'f342a1fd7785b53961c2b74f54d966bb6418c3a72ee06d37c562d20873451884'
	'70454385d5f6c51a1524928976526df00da80aa6a7061bb37e669040645a5f11'
	'd912e5e889c50ecdae880728dc78bf227f4f736ab27a3748f97f343658e2c30a'
	'd7ca2a58dfd0c44352dbb70ec48a3ba20ea514be7652cc023785a4cdb5257e05'
	'e2797c0591e45b7cf4e7e8d3b926803bcff129d88dfe3b54f63dc61e0c8377de'
)

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i '../0001-build-Don-t-treat-warnings-as-errors.patch'
	patch -p1 -i '../gnome-terminal-symbolic-new-tab-icon.patch'
	patch -p1 -i '../0001-notebook-Don-t-change-show-tabs-when-going-to-empty-.patch'
	patch -p1 -i '../0001-window-Exit-early-from-screen-removed-handler-for-no.patch'
	patch -p1 -i '../0001-window-Pass-tab-switching-keys-to-the-terminal-for-t.patch'
	patch -p1 -i '../gnome-terminal-restore-dark-transparency.patch'
	patch -p1 -i '../gnome-terminal-command-notify.patch'

	autoreconf -f -i
}

build() {
	cd "${_pkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--libexecdir=/usr/lib/${_pkgname} --disable-static --with-nautilus-extension
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
