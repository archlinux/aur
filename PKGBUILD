# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-fedora
_pkgname=gnome-terminal
pkgver=3.17.91
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with Fedora patches"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3-notification gsettings-desktop-schemas dconf libnautilus-extension)
makedepends=(gnome-doc-utils intltool itstool docbook-xsl desktop-file-utils
             appdata-tools gnome-shell gconf vala yelp-tools)
optdepends=('gconf: settings migration when upgrading from older version')
options=('!emptydirs')
url="http://www.gnome.org"
conflicts=('gnome-terminal')
install=gnome-terminal-fedora.install
source=("https://download.gnome.org/sources/$_pkgname/${pkgver::4}/$_pkgname-$pkgver.tar.xz"
	'0001-build-Don-t-treat-warnings-as-errors.patch'
	'gnome-terminal-restore-dark-transparency.patch'
	'gnome-terminal-command-notify.patch'
	'org.gnome.Terminal.gschema.override')
sha256sums=('7f4e190f64fcbfd425727801500cd7516376c229de50b654ecbe5410fadf6771'
	'83c42ed513e374c181b23da4f9fce39e197c1e09ae328147b2b2bcdfbc4c99d7'
	'173e9aada1dfa2c2b29bc82fe539b9bcf6c9ca6f9710e526367eb8cd0eb0925e'
	'99f693b7d176cc11b66eb26e561b9c2dd8e105d8e3e6462365eed57543734499'
	'e2797c0591e45b7cf4e7e8d3b926803bcff129d88dfe3b54f63dc61e0c8377de')

prepare () {
	cd "${_pkgname}-${pkgver}"

	patch -p1 -i ../0001-build-Don-t-treat-warnings-as-errors.patch
	patch -p1 -i ../gnome-terminal-restore-dark-transparency.patch
	patch -p1 -i ../gnome-terminal-command-notify.patch

	autoreconf -f -i
}

build() {
	cd "${_pkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--libexecdir=/usr/lib/${_pkgname} --disable-static --with-nautilus-extension \
		--enable-debug
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
