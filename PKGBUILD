# Contributor: dragonn <dragonn at op dot pl>
# Contributor: Smola <smola at mail dot ua>
# Contributor: Blitz67

pkgname=obshutdown-noerror
pkgver=0.1_rc1
pkgrel=2
pkgdesc='Openbox shutdown manager - disabled error messages'
arch=('i686' 'x86_64')
provides=('obshutdown')
conflicts=('obshutdown' 'obshutdown-git')
url='https://github.com/panjandrum'
license=('GPL')
depends=('gtk2' 'cairo')
makedepends=('make')
source=("https://github.com/downloads/panjandrum/obshutdown/obshutdown-${pkgver/_/-}.tar.gz")
sha1sums=('ade28471c3d1af3a4640e1836ea9a05634274503')


build() {
	cd "${srcdir}/obshutdown-${pkgver/_/-}"
	./configure --prefix=/usr

	IFS=$(echo -en "\n\b");
	for i in $(grep -lR "#include <glib" src/);
	do
		sed -i 's/#include <glib\/.*>/#include <glib\.h>/g' "$i";
	done;

	# Disable annoying error messages
	sed -e '/Obshutdown alredy running/ s/^/\/\//' -i src/main.c
	sed -e '/Lockfile creating failed/ s/^/\/\//' -i src/main.c

	make
}
package() {
	cd "${srcdir}/obshutdown-${pkgver/_/-}"
	make DESTDIR="${pkgdir}" install
}
