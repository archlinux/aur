# Maintainer: Christer Solskogen <christer.solskogen@gmail.com

_arch=powerpc
_target=$_arch-none-eabi
pkgname=$_target-toolchain
pkgver=20171221
pkgrel=2
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('zlib' 'bash' 'libmpc')
url="http://www.gnu.org"
conflicts=($_target-elf-gcc $_arch-elf-binutils $_arch-elf-newlib)
arch=('x86_64')
depends=(libelf)
_gcc=gcc-10.2.0
_binutils=binutils-2.36.1
_newlib=newlib-4.1.0
license=('GPL' 'BSD')
options=('!strip')

source=("http://gnuftp.uib.no/gcc/${_gcc}/${_gcc}.tar.xz"
	"http://gnuftp.uib.no/binutils/${_binutils}.tar.xz"
	"ftp://sourceware.org/pub/newlib/${_newlib}.tar.gz")

sha512sums=('42ae38928bd2e8183af445da34220964eb690b675b1892bbeb7cd5bb62be499011ec9a93397dba5e2fb681afadfc6f2767d03b9035b44ba9be807187ae6dc65e'
            'cc24590bcead10b90763386b6f96bb027d7594c659c2d95174a6352e8b98465a50ec3e4088d0da038428abe059bbc4ae5f37b269f31a40fc048072c8a234f4e9'
            '6a24b64bb8136e4cd9d21b8720a36f87a34397fd952520af66903e183455c5cf19bb0ee4607c12a05d139c6c59382263383cb62c461a839f969d23d3bc4b1d34')



prepare() {
	cd "${srcdir}/${_gcc}"
	
	#we use libiberty from binutils. Otherwise the compilation will fail.
	rm -rf libiberty

	for i in bfd binutils gas ld libiberty libctf opcodes; do ln -sv ../${_binutils}/$i; done
	for i in newlib libgloss; do ln -sf ../${_newlib}/$i; done

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	_cppflags=$CPPFLAGS
	unset CPPFLAGS

	CFLAGS="$_cppflags $CFLAGS"
	mkdir -p "${srcdir}/obj"
}

build()
{
	cd "${srcdir}/obj"
	"${srcdir}/${_gcc}/configure" --prefix=/usr --libexecdir=/usr/lib --target=${_target} --enable-languages=c,c++ --disable-libstdcxx-pch \
	--with-newlib --with-libgloss --with-system-zlib --disable-nls --enable-plugins --enable-deterministic-archives --enable-relro --enable-__cxa_atexit \
   --enable-linker-build-id --enable-plugin --enable-checking=release --enable-host-shared --disable-libssp --disable-libunwind-exceptions

	make
}

package()
{
	cd "${srcdir}/obj"
	make install DESTDIR="${pkgdir}" -j1
	rm -rf "${pkgdir}"/usr/share
	rm -rf "${pkgdir}"/usr/include
	rm -rf "${pkgdir}"/usr/lib/libcc1.*
	find "${pkgdir}" -name '*.py' -delete 


	# local variable is scoped to the function, for general tidiness. 
	local regex='ELF ().*(executable|shared object).*'
	# read null-terminated filenames from stdin, and use a while loop to operate on each one
	# for each run of the loop, the filename is stored in the intuitive variable "filename". :) 
	while read -r -d '' filename; do
	# test if the output of `file` matches the regular expression defined earlier
	if [[ $(file -b "$filename") =~ $regex ]]; then
       	 # awesome, it matches! So, do the standard strip routine since this isn't an $_target executable
        	strip --strip-unneeded "$filename"
    	fi
	# this find command uses process substitution to pass the output of find into the `while read` loop
	done < <(find "$pkgdir" -type f -print0)

	find "${pkgdir}/usr/lib/gcc/${_target}" "${pkgdir}/usr/${_target}/lib" -type f -name '*.o' -o -name '*.a' -exec "${pkgdir}"/usr/bin/${_target}-strip -g {} +

	#fix permissions to please namcap
	find "${pkgdir}/usr/${_target}/lib" -name '*.a' -exec chmod 644 {} +
	chown -R root:root "$pkgdir"

}



