# Maintainer: Christer Solskogen <christer.solskogen@gmail.com

_arch=powerpc
_target=$_arch-none-eabi
pkgname=$_target-toolchain
pkgver=20230420
pkgrel=1
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('zlib' 'bash' 'libmpc' 'libisl')
url="http://www.gnu.org"
arch=('x86_64')
depends=(libelf)
makedepends=(git)
license=('GPL' 'BSD')
options=('!strip')
_binutils_commit=594dcc92e8d1f6bb30e3dfa4eb343febcda66f1a
_gcc_commit=015cf9f84b0b6792f982e505392ca574e04c8d23
_newlib_commit=ab49db3a8c08e2240e53d8f12d6a14fd285def4e

source=(git+https://sourceware.org/git/binutils-gdb.git#commit=${_binutils_commit}
                  git+https://sourceware.org/git/gcc.git#commit=${_gcc_commit}
                  git+https://sourceware.org/git/newlib-cygwin.git#commit=${_newlib_commit}
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

CFLAGS=${CFLAGS/-Werror=format-security/}
CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

prepare() {
	cd "${srcdir}"/binutils-gdb
	
	#for i in bfd binutils gas gold ld libctf libsframe opcodes; do ln -snfv ../binutils-gdb/$i; done
	for i in gcc fixincludes libcody libcpp libgcc libstdc++-v3; do ln -snfv ../gcc/$i; done
	for i in newlib libgloss; do ln -snfv ../newlib-cygwin/$i; done

	mkdir -p "${srcdir}/obj"
}

build()
{
	cd "${srcdir}"/obj
	"${srcdir}"/binutils-gdb/configure --prefix=/usr --libexecdir=/usr/lib --target=${_target} --enable-languages=c,c++ --disable-libstdcxx-pch \
	--with-newlib --with-libgloss --with-system-zlib --disable-nls --enable-plugins --enable-deterministic-archives --enable-relro --enable-__cxa_atexit \
	--enable-linker-build-id --enable-plugin --enable-checking=release --enable-host-shared --disable-libssp --disable-libunwind-exceptions --disable-source-highlight 

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
