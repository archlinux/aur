# Contributor: Marek Hilton <marek.hilton1 /at/ gmail.com>
_pkgname=gle-graphics
pkgname=$_pkgname-git
pkgver=4.3.3_23_g6b14630
pkgrel=1
arch=('x86_64')
pkgdesc='Graphics scripting language for creating publication quality figures'
url='https://glx.sourceforge.io/index.html'
license=('BSD' 'GPL')
depends=('qt5-base' 'cairo' 'libtiff' 'freeglut' 'glu' 'libdeflate' 'libpng' 'zlib' 'pixman'  'libjpeg' 'glibc' 'gcc-libs' 'xz' 'libglvnd')
makedepends=('boost' 'cmake' 'cairo' 'zlib' 'libpng' 'libtiff' 'pixman' 'libjpeg' 'qt5-base')
optdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+https://github.com/vlabella/GLE.git#commit=6b14630
        ${_pkgname}_lib::git+https://github.com/vlabella/gle-library.git
        ${_pkgname}_man::git+https://github.com/vlabella/gle-manual.git)
md5sums=('SKIP'
	 'SKIP'
	 'SKIP')
LDFLAGS="-Wl,-O1,--sort-common,-z,relro,-z,now"


build() {
	cd "$srcdir/$_pkgname"
	cmake -S src -B build\
	      -DCMAKE_INSTALL_PREFIX="/usr/lib/${_pkgname}"\
	      -DCMAKE_BUILD_TYPE=Release\
	      -DGLE_EXAMPLES_LIBRARY_PATH="$srcdir/${_pkgname}_lib"\
	      -DGLE_USER_MANUAL_PATH="$srcdir/${_pkgname}_man"
	
	cd build
	make

	# WORKAROUND: Make the inittex.ini in-place
	echo "Generating inittex.ini"
	cp "$srcdir/$_pkgname/src/TeX/init.tex" ./gle/
	GLE_TOP=./gle ./gle/gle -mkinittex
}

package() {
	cd "$srcdir/$_pkgname/build"

	make DESTDIR="$pkgdir" install

	install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	mkdir ${pkgdir}/usr/bin -p
	ln -s "/usr/lib/${_pkgname}/bin/fbuild" "${pkgdir}/usr/bin/fbuild"
	ln -s "/usr/lib/${_pkgname}/bin/gle" "${pkgdir}/usr/bin/gle"
	ln -s "/usr/lib/${_pkgname}/bin/glebtool" "${pkgdir}/usr/bin/glebtool"
	ln -s "/usr/lib/${_pkgname}/bin/makefmt" "${pkgdir}/usr/bin/makefmt"
	ln -s "/usr/lib/${_pkgname}/bin/qgle" "${pkgdir}/usr/bin/qgle"

	# WORKAROUND: Install inittex.ini
	install gle/inittex.ini "$pkgdir/usr/lib/$_pkgname/"
}
