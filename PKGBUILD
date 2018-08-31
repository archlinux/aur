# Maintainer: Martin Poehlmann <mpdeimos@outlook.com>

pkgname=california
pkgver=0.4.0
pkgrel=3
pkgdesc='A new calendar application for GNOME 3. It is currently under heavy development.'
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/California"
license=('LGPL2.1')
depends=('evolution-data-server' 'libgee' 'xdg-utils')
makedepends=('vala' 'intltool' 'gnome-common' 'yelp-tools' 'gobject-introspection' 'patch')
install="${pkgname}.install"
source=(
	'https://download.gnome.org/sources/california/0.4/california-0.4.0.tar.xz'
	'https://src.fedoraproject.org/cgit/rpms/california.git/plain/0002-Build-with-evolution-data-server-3.13.90.patch'
	'https://src.fedoraproject.org/cgit/rpms/california.git/plain/california-0.4.0-libical-3.0.patch'
)
sha256sums=(
	'b25f356363a9f8f8f93c7ab78af02de39f9c3b71964663129ac9904de9147eb6'
	'f512f50470954ec4018c99c49c37fa7e23074653a2e090ff13e32631ec10293d'
	'c6924c868d2b44639463ce7e426c5917377ec7d0d6aa0fd38f7a018a9563be33'
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < ../0002-Build-with-evolution-data-server-3.13.90.patch
	patch -p1 < ../california-0.4.0-libical-3.0.patch
	./configure \
		--prefix=/usr \
		--disable-fatal
	sed -i 's#californiadocdir = ${prefix}#californiadocdir = ${datadir}#g' Makefile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR="$pkgdir"
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
