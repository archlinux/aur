# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Based mainly on original 'gettext' PKGBUILD

pkgname=gettext-java
_pkgbase=gettext
pkgver=0.19.8.1
pkgrel=1
pkgdesc="GNU internationalization library - Java libraries"
arch=('any')
url="http://www.gnu.org/software/gettext/"
license=('GPL')
depends=('java-environment' "gettext>=$pkgver")
optdepends=('git: for autopoint infrastructure updates')
options=(!docs)
source=(ftp://ftp.gnu.org/pub/gnu/gettext/${_pkgbase}-${pkgver}.tar.gz{,.sig})
md5sums=('97e034cf8ce5ba73a28ff6c3c0638092'
         'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno

prepare() {
	# Do a dirty installation: install files in a temporary
	# directory and install them there, then package just new stuff
	mkdir -p "${srcdir}/temp"
}

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make -j1 -k check
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	# New stuff from here
	# Install in the junk directory, not pkgdir
	make DESTDIR="${srcdir}/temp" install

	# Now move just what we need
	install -Dm644 "${srcdir}/temp/usr/share/gettext/gettext.jar" "$pkgdir/usr/share/gettext/gettext.jar"
	install -Dm644 "${srcdir}/temp/usr/share/gettext/libintl.jar" "$pkgdir/usr/share/gettext/libintl.jar"

	# Create a symbolic link in /usr/share/java as Java apps written for Ubuntu may be looking there
	mkdir -p "$pkgdir/usr/share/java/"
	ln -s "/usr/share/gettext/gettext.jar" "$pkgdir/usr/share/java/gettext.jar"
	ln -s "/usr/share/gettext/libintl.jar" "$pkgdir/usr/share/java/libintl.jar"

	# Remove junk directory
	rm -r "${srcdir}/temp/"
}
