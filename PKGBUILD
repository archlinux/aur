# Maintainer: Christer Solskogen <christer.solskogen@gmail.com

_target=m68k-elf
pkgname=$_target-toolchain
pkgver=20210804
pkgrel=1
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('zlib' 'bash' 'libmpc')
url="http://www.gnu.org"
conflicts=($_target-gcc $_target-binutils $_target-newlib)
arch=('x86_64')
depends=('libelf' 'libmpc')
_gcc=gcc-11.2.0
_binutils=binutils-2.37
_newlib=newlib-4.1.0
license=('GPL' 'BSD')
options=('!strip')

source=("http://gnuftp.uib.no/gcc/${_gcc}/${_gcc}.tar.xz"
	"http://gnuftp.uib.no/binutils/${_binutils}.tar.xz"
	"http://sourceware.org/pub/newlib/${_newlib}.tar.gz")

sha512sums=('d53a0a966230895c54f01aea38696f818817b505f1e2bfa65e508753fcd01b2aedb4a61434f41f3a2ddbbd9f41384b96153c684ded3f0fa97c82758d9de5c7cf'
            '5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7'
            '6a24b64bb8136e4cd9d21b8720a36f87a34397fd952520af66903e183455c5cf19bb0ee4607c12a05d139c6c59382263383cb62c461a839f969d23d3bc4b1d34')

prepare() {
	cd "${srcdir}/${_gcc}"
	
	#we use libiberty from binutils. Otherwise the compilation will fail.
	rm -rf libiberty

	for i in bfd binutils gas ld libiberty libctf opcodes; do ln -sv ../${_binutils}/$i; done
	for i in newlib libgloss; do ln -sf ../${_newlib}/$i; done

	mkdir -p "${srcdir}/obj"
}

build()
{
        CFLAGS=${CFLAGS/-Werror=format-security/}
        CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

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
	rm -rf "${pkgdir}"/usr/lib/bfd-plugins
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

}



