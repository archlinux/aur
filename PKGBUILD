# Contributor: SebRmv <sbriais at-symbol free dot fr>
# PKGBUILD based on mipsel-linux-gnu-binutils
# (make by: Vojtech Horky <vojta . horky at-symbol seznam . cz>)
pkgname=m68k-atari-mint-binutils
_pkgname=binutils
_target="m68k-atari-mint"
pkgver=2.30
pkgrel=2
pkgdesc="A set of programs to assemble and manipulate binary and object files for the M68K architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
replaces=('cross-m68k-atari-mint-binutils')
conflicts=('cross-m68k-atari-mint-binutils')
source=("ftp://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.bz2" "binutils-2.30-mint-20180703.patch.bz2")
sha1sums=('33d807f7fa680b00439eb5560acd0c2ef645e5f9' 'bbf149ff3e6d8b15a217b71ad79fdb020a804e01')
_sysroot="/usr/lib/${_target}"

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

        patch -Np1 < ../binutils-2.30-mint-20180703.patch
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		"--disable-nls" \
		|| return 1
		
	make all || return 1
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install || return 1
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native binutils)
	rm -Rf ${pkgdir}${_sysroot}/share/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'm68k-atari-mint*' -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}

