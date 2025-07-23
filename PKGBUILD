# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Contributor: Daniel Hillenbrand < codeworkx at bbqlinux dot org >
# Contributor: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname=mipsel-linux-gnu-binutils-minimal
_pkgname=binutils
_target="mipsel-linux-gnu"
pkgver=2.44
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the MIPS architecture"
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL')
depends=('xz')
provides=('mipsel-linux-gnu-binutils')
conflicts=('mipsel-linux-gnu-binutils')
source=(https://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=(
	'ce2017e059d63e67ddb9240e9d4ec49c2893605035cd60e92ad53177f4377237'
	'b8e0b848b8f615a02b5f91d2f6992db0c062689bc7d4d0fee68edfaf34dee29f'
)
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
_sysroot="/usr/lib/${_target}"

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	# Hack - see native package for details
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {

	cd ${srcdir}/${_pkgname}-${pkgver}
	
	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		--disable-werror \
		"--disable-nls" \
		--with-gcc --with-gnu-as --with-gnu-ld \
		--without-included-gettext
		
	make all
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native binutils)
	rm -Rf ${pkgdir}${_sysroot}/share/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'mipsel-linux-gnu-*' -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/${_target}/;
	cd ${pkgdir}/usr/bin/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}
