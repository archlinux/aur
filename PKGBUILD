# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Based mainly on original 'gettext' PKGBUILD

pkgname=gettext-java
_pkgbase=gettext
pkgver=0.19.4
pkgrel=1
pkgdesc="GNU internationalization library - Java libraries"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gettext/"
license=('GPL')
groups=('base' 'base-devel')
depends=('gcc-libs' 'acl' 'sh' 'glib2' 'libunistring')
makedepends=('java-environment')
optdepends=('git: for autopoint infrastructure updates')
options=(!docs)
install=gettext.install
source=(ftp://ftp.gnu.org/pub/gnu/gettext/${_pkgbase}-${pkgver}.tar.gz{,.sig}
	fix_buggy_msgunfmt3.patch)
md5sums=('d3511af1e604a3478900d2c2b4a4a48e'
         'SKIP'
         'd80847a08b5c6566a3ef940c52347d37')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno

prepare() {
	# Fixing an error in 'make check', see patch headers
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	patch -Np1 -i "$srcdir/fix_buggy_msgunfmt3.patch"

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
	# Remove junk directory
	rm -r "${srcdir}/temp/"
}
