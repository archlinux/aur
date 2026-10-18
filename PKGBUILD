# Maintainer: pounceandmiss <pounceandmiss@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
#
# Based on the Arch Linux tcl PKGBUILD.
#
# Installed into its own prefix (/usr/lib/tcl9) so it can live next to the
# repo's tcl 8.6. Only versioned tclsh symlinks are added to /usr/bin.
# To build extensions against it use --with-tcl=/usr/lib/tcl9/lib or
# PKG_CONFIG_PATH=/usr/lib/tcl9/lib/pkgconfig.

pkgname=tcl9
pkgver=9.1.0
pkgrel=1
pkgdesc='Powerful, easy-to-learn dynamic programming language (version 9, parallel-installable with tcl 8.6)'
arch=(x86_64)
url='https://www.tcl-lang.org/'
license=(TCL)
depends=(glibc zlib)
options=(staticlibs !lto)
_archive="tcl$pkgver"
source=("https://downloads.sourceforge.net/sourceforge/tcl/$_archive-src.tar.gz")
sha256sums=('536c45543f64d6eb11832d97ba3494aacff046fbc5040273bd55258d0e448ff1')

_prefix=/usr/lib/tcl9

build() {
	cd "$_archive/unix"
	# --disable-zipfs installs the script library as plain files instead of
	# appending it to libtcl9.1.so, where makepkg's strip would remove it.
	./configure \
		--prefix=$_prefix \
		--enable-threads \
		--enable-64bit \
		--disable-zipfs
	make
}

package() {
	cd "$_archive/unix"
	make INSTALL_ROOT="$pkgdir" install install-private-headers
	chmod 644 "$pkgdir$_prefix/lib/libtclstub.a"
	install -Dm644 ../license.terms -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -d "$pkgdir/usr/bin"
	ln -s ../lib/tcl9/bin/tclsh${pkgver%.*} "$pkgdir/usr/bin/tclsh${pkgver%.*}"
	ln -s ../lib/tcl9/bin/tclsh${pkgver%.*} "$pkgdir/usr/bin/tclsh9"

	# Mirror the source tree layout that extensions (Tk, TEA test targets)
	# expect under $TCL_SRC_DIR, like Debian's tcl-private
	local dir
	for dir in compat generic libtommath unix; do
		install -Dm644 -t "$pkgdir$_prefix/include/tcl-private/$dir" ../$dir/*.h
	done
	ln -s ../../lib/tcl${pkgver%.*} "$pkgdir$_prefix/include/tcl-private/library"

	# remove buildroot traces
	sed -e "s#$srcdir/$_archive/unix#$_prefix/lib#g" \
		-e "s#$srcdir/$_archive#$_prefix/include/tcl-private#g" \
		-i "$pkgdir$_prefix/lib/tclConfig.sh"

	local cfg name
	for cfg in "$pkgdir$_prefix"/lib/*/*Config.sh; do
		name=$(basename "$(dirname "$cfg")")
		sed -e "s#$srcdir/$_archive/unix/pkgs/$name#$_prefix/lib/$name#g" \
			-e "s#$srcdir/$_archive/pkgs/$name/generic#$_prefix/include#g" \
			-e "s#$srcdir/$_archive/pkgs/$name/library#$_prefix/lib/tcl${pkgver%.*}#g" \
			-e "s#$srcdir/$_archive/pkgs/$name#$_prefix/include#g" \
			-i "$cfg"
	done
}
