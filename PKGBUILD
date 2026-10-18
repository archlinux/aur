# Maintainer: pounceandmiss <pounceandmiss@proton.me>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
#
# Based on the Arch Linux tk PKGBUILD.
#
# Installed into the tcl9 prefix (/usr/lib/tcl9) so it can live next to the
# repo's tk 8.6. Only versioned wish symlinks are added to /usr/bin.

pkgname=tk9
pkgver=9.1.0
pkgrel=1
pkgdesc='A windowing toolkit for use with tcl (version 9, parallel-installable with tk 8.6)'
arch=(x86_64)
url='https://www.tcl-lang.org/'
license=(TCL)
depends=(tcl9
         at-spi2-core
         fontconfig
         glib2
         harfbuzz
         libcups
         libx11
         libxext
         libxft
         libxrender
         libxss)
options=(staticlibs)
_archive="tk$pkgver"
source=("https://downloads.sourceforge.net/sourceforge/tcl/$_archive-src.tar.gz")
sha256sums=('772ce7a97c07c2db4c957c93af7ab4dff4bd3037772836b6afbcd0974023b3d6')

_prefix=/usr/lib/tcl9

build() {
	cd "$_archive/unix"
	./configure \
		--prefix=$_prefix \
		--with-tcl=$_prefix/lib \
		--enable-threads \
		--enable-64bit \
		--disable-zipfs
	make
}

package() {
	cd "$_archive/unix"
	make INSTALL_ROOT="$pkgdir" install install-private-headers
	chmod 644 "$pkgdir$_prefix/lib/libtkstub.a"
	install -Dm644 ../license.terms -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -d "$pkgdir/usr/bin"
	ln -s ../lib/tcl9/bin/wish${pkgver%.*} "$pkgdir/usr/bin/wish${pkgver%.*}"
	ln -s ../lib/tcl9/bin/wish${pkgver%.*} "$pkgdir/usr/bin/wish9"

	# install private headers (FS#14388, FS#47616)
	local dir
	for dir in generic generic/ttk unix; do
		install -Dm644 -t "$pkgdir$_prefix/include/tk-private/$dir" ../$dir/*.h
	done

	# remove buildroot traces
	sed -e "s#$srcdir/$_archive/unix#$_prefix/lib#g" \
		-e "s#$srcdir/$_archive#$_prefix/include/tk-private#g" \
		-i "$pkgdir$_prefix/lib/tkConfig.sh"
}
