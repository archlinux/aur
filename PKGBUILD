# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Daniel Hillenbrand < codeworkx at bbqlinux dot org >
# Maintainer: Liao Junxuan <mikeljx at 126 dot com>

pkgname=mipsel-elf-binutils
_pkgname=binutils
_target="mipsel-elf"
pkgver=2.37
pkgrel=1
pkgdesc="A collection of binary tools for baremetal MIPS."
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL')
depends=()
source=("https://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c')
_sysroot="/usr/lib/${_target}"

prepare() {
	cd ""$srcdir""/${_pkgname}-${pkgver}
	
	# Hack - see native package for details
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {

	cd ""$srcdir""/${_pkgname}-${pkgver}
	
    mkdir -p binutils-build && cd binutils-build

	../configure \
		--prefix="${_sysroot}" \
		--bindir=/usr/bin --program-prefix="${_target}-" \
		--with-sysroot="${_sysroot}" \
		--target="${_target}" --build="$CHOST" --host="$CHOST" \
		--disable-werror \
		--disable-nls \
		--with-gcc --with-gnu-as --with-gnu-ld \
		--without-included-gettext
		
	make all
}

check() {
	cd ""$srcdir""/${_pkgname}-${pkgver}
    cd binutils-build
    make check
}

package() {
	cd ""$srcdir""/${_pkgname}-${pkgver}
    cd binutils-build
	
	make DESTDIR="""$pkgdir""" install
	
    # remove the documentation
	rm -rf """$pkgdir"""${_sysroot}/share
}
