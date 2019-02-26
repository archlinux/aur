# Maintainer: Christer Solskogen <christer.solskogen@gmail.com


_target=m68k-elf
pkgname=$_target-toolchain
pkgver=20190226
pkgrel=1
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('zlib' 'bash' 'libmpc')
url="http://www.gnu.org"
conflicts=('m68k-elf-gcc' 'm68k-elf-binutils' 'm68k-elf-newlib')
arch=('x86_64')
_gcc=gcc-8.3.0
_binutils=binutils-2.32
_newlib=newlib-3.1.0
license=('GPL' 'BSD')
options=('!strip')

source=("http://gnuftp.uib.no/gcc/${_gcc}/${_gcc}.tar.xz"
	"http://gnuftp.uib.no/binutils/${_binutils}.tar.xz"
	"ftp://sourceware.org/pub/newlib/${_newlib}.tar.gz")

sha512sums=('1811337ae3add9680cec64968a2509d085b6dc5b6783fc1e8c295e3e47416196fd1a3ad8dfe7e10be2276b4f62c357659ce2902f239f60a8648548231b4b5802'
            'd326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a'
            'efc4c3ab7153387780d141386bca5d3e20c9d25ae3e6b87cf94c8df9d301ce5926dacdff9bd33aeb9781559d933c3d0ae77f4e5b46120d90792f75dbfde702c7')

prepare() {
	cd "${srcdir}/${_gcc}"
	
	for i in bfd binutils gas ld opcodes; do ln -sv ../${_binutils}/$i; done
	for i in newlib libgloss; do ln -sf ../${_newlib}/$i; done

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
        sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

	mkdir -p "${srcdir}/obj"
}

build()
{
	cd "${srcdir}/obj"
	"${srcdir}/${_gcc}/configure" --prefix=/usr --libexecdir=/usr/lib --target=${_target} --enable-languages=c,c++ --disable-libstdcxx-pch \
	--with-newlib --with-libgloss --with-system-zlib --disable-nls --enable-checking=release

	make
}

package()
{
	cd "${srcdir}/obj"
	make DESTDIR="${pkgdir}" install -j2
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

}



