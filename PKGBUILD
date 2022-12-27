# Maintainer: Christer Solskogen <christer.solskogen@gmail.com

_arch=aarch64
_target=$_arch-none-elf
pkgname=$_target-toolchain
pkgver=20221227
pkgrel=1
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('zlib' 'bash' 'libmpc' 'libisl')
url="http://www.gnu.org"
conflicts=($_target-elf-gcc $_arch-elf-binutils $_arch-elf-newlib)
arch=('x86_64')
depends=('libelf' 'libmpc' 'libisl')
_gcc=gcc-12.2.0
_binutils=binutils-2.39
_newlib=newlib-4.2.0.20211231
license=('GPL' 'BSD')
options=(!strip)

source=("http://gnuftp.uib.no/gcc/${_gcc}/${_gcc}.tar.xz"
	"http://gnuftp.uib.no/binutils/${_binutils}.tar.xz"
	"ftp://sourceware.org/pub/newlib/${_newlib}.tar.gz")

sha512sums=('e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173'
            '68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3'
            '0c3efd7b74a6b8457a717cbb6aa6c5ff268eeaba375535465c6bd6502c3d32b54a9bc3ba7f2c6990f78e29152eee2f62acb39b674d24f9ddf440374a1ec9d2e8')

CFLAGS=${CFLAGS/-Werror=format-security/}
CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

prepare() {
	cd "${srcdir}/${_gcc}"
	
	for i in bfd binutils gas gold ld libctf opcodes; do ln -sv ../${_binutils}/$i; done
	for i in newlib libgloss; do ln -sf ../${_newlib}/$i; done

	mkdir -p "${srcdir}/obj"
}

build()
{
	cd "${srcdir}/obj"
	"${srcdir}/${_gcc}/configure" --prefix=/usr --libexecdir=/usr/lib --target=${_target} --enable-languages=c,c++ --disable-libstdcxx-pch \
	--with-system-zlib --disable-nls

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
