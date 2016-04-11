# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# This package provides pngcrush bundled with libpng and zlib.
# The pngcrush provided in [community] repository uses libpng and zlib from system libraries.
#
# Advantages of having pngcrush bundled with libpng and zlib:
#   - produces slightly smaller PNG files
#   - ability to read erroneous PNG files with "Too many IDAT's"
#   - avoids warnings when pngcrush is not yet rebuild or updated after a libpng/zlib update
#
# Disadvantages of having pngcrush bundled with libpng and zlib:
#   - slightly slower execution
#   - higher pngcrush executable filesize

_srcname=pngcrush
pkgname=pngcrush-bundled
pkgver=1.8.1
pkgrel=1
pkgdesc="A tool for optimizing the compression of PNG files (with bundled libpng and zlib)"
arch=('i686' 'x86_64')
url="http://pmt.sourceforge.net/pngcrush/"
license=('custom')
depends=('glibc')
provides=('pngcrush')
conflicts=('pngcrush')
source=("https://sourceforge.net/projects/pmt/files/pngcrush/${pkgver}/pngcrush-${pkgver}.tar.xz")
sha256sums=('64921ca7e6013a2ff3f4e1387c95cec6c30fd7396069e5ddf68008993f46768b')

prepare() {
	cd "$_srcname"-"$pkgver"
	
	sed -r 's|^(CPPFLAGS )=|\1+=|' -i Makefile
	sed -r 's|^(CFLAGS )=|\1+=|'   -i Makefile
	sed -r 's|^(LDFLAGS )=|\1+=|'  -i Makefile
}

build() {
	cd "$_srcname"-"$pkgver"
	
	make
}

package() {
	cd "$_srcname"-"$pkgver"
	
	# Install pngcrush executable
	install -D -m755 pngcrush "${pkgdir}/usr/bin/pngcrush"
	
	# Create a LICENSE file for pngcrush. Note: license is in the file "pngcrush.c".
	sed -n '10,159p' pngcrush.c > LICENSE-pngcrush # create file
	sed -i '1,150s/^.\{,3\}//' LICENSE-pngcrush    # erase C comments
	
	# Modify sections in cexcept, libpng and zlib to reflect the provided LICENSE files:
	sed -i '80s/lines 10/LICENSE-cexcept./' LICENSE-pngcrush
	sed -i -e '81d' LICENSE-pngcrush
	sed -i "84s/If libpng/libpng/" LICENSE-pngcrush
	sed -i "84s/,/ and/" LICENSE-pngcrush
	sed -i "85s/png.h/LICENSE-libpng/" LICENSE-pngcrush
	sed -i "89s/If zlib/zlib/" LICENSE-pngcrush
	sed -i "89s/,/ and/" LICENSE-pngcrush
	sed -i "91s/zlib.h/LICENSE-zlib/" LICENSE-pngcrush
	 
	sed -i '1ipngcrush' LICENSE-pngcrush           # include software name at the top
	sed -i '2i\\' LICENSE-pngcrush                 # insert blank line after
	
	# Create a LICENSE file for cexcept. Note: license is in the file "cexcept.h".
	sed -n '10,17p' cexcept.h > LICENSE-cexcept    # create file
	sed -i '1,8s/^.\{,4\}//' LICENSE-cexcept       # erase leading spaces
	sed -i '1icexcept' LICENSE-cexcept             # include software name at the top
	sed -i '2i\\' LICENSE-cexcept                  # insert blank line after
	
	# Create a LICENSE file for libpng. Note: license is in the file "png.h".
	sed -n '21,109p' png.h > LICENSE-libpng    # create file
	sed -i '1,89s/^.\{,3\}//' LICENSE-libpng   # erase C comments
	sed -i '1ilibpng' LICENSE-libpng           # include software name at the top
	sed -i '2i\\' LICENSE-libpng               # insert blank line after
	
	# Create a LICENSE file for zlib. Note: license is in the file "zlib.h".
	sed -n '4,28p' zlib.h > LICENSE-zlib       # create file
	sed -i '1,25s/^.\{,2\}//' LICENSE-zlib     # erase leading spaces
	sed -i '1izlib' LICENSE-zlib               # include software name at the top
	sed -i '2i\\' LICENSE-zlib                 # insert blank line after
	
	# Install LICENSE files
	install -D -m644 LICENSE-pngcrush "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-pngcrush"
	install -D -m644 LICENSE-cexcept  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cexcept"
	install -D -m644 LICENSE-libpng   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-libpng"
	install -D -m644 LICENSE-zlib     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-zlib"
}
