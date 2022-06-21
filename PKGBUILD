# Maintainer: Christer Solskogen <christer.solskogen@gmail.com

_arch=aarch64
_target=$_arch-none-elf
pkgname=$_target-toolchain
pkgver=20220621
pkgrel=1
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('zlib' 'bash' 'libmpc' 'libisl')
url="http://www.gnu.org"
conflicts=($_target-elf-gcc $_arch-elf-binutils $_arch-elf-newlib)
arch=('x86_64')
depends=('libelf' 'libmpc' 'libisl')
_gcc=gcc-12.1.0
_binutils=binutils-2.38
_newlib=newlib-4.2.0.20211231
license=('GPL' 'BSD')
options=('!strip')

source=("http://gnuftp.uib.no/gcc/${_gcc}/${_gcc}.tar.xz"
	"http://gnuftp.uib.no/binutils/${_binutils}.tar.xz"
	"ftp://sourceware.org/pub/newlib/${_newlib}.tar.gz")

sha512sums=('2121d295292814a6761edf1fba08c5f633ebe16f52b80e7b73a91050e71e1d2ed98bf17eebad263e191879561c02b48906c53faa4c4670c486a26fc75df23900'
            '8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d'
            '0c3efd7b74a6b8457a717cbb6aa6c5ff268eeaba375535465c6bd6502c3d32b54a9bc3ba7f2c6990f78e29152eee2f62acb39b674d24f9ddf440374a1ec9d2e8')

CFLAGS=${CFLAGS/-Werror=format-security/}
CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

prepare() {
	cd "${srcdir}/${_gcc}"
	
	#we use libiberty from binutils. Otherwise the compilation will fail.
	rm -rf libiberty

	for i in bfd binutils gas gold ld libiberty libctf opcodes; do ln -sv ../${_binutils}/$i; done
	for i in newlib libgloss; do ln -sf ../${_newlib}/$i; done

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
