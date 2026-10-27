# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

_target=m68k-elf
pkgname=$_target-toolchain
pkgver=20261027
pkgrel=1
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('bash' 'zlib' 'zstd' 'gmp' 'mpfr' 'libmpc' 'libisl'
         'libelf' 'expat' 'ncurses' 'readline' 'python' 'xz' 'xxhash')
url="https://www.gnu.org"
conflicts=("$_target-gcc" "$_target-binutils" "$_target-newlib" "$_target-gdb")
arch=('x86_64')
makedepends=('git')
license=('GPL' 'BSD')
options=('!strip' '!debug' '!lto' 'staticlibs')
_binutils_commit=cd679f551a3961ba3ac17a8f9e48d86323207b7c
_gcc_commit=b567707db43a9990e4319c0c38f4b0c752d45ac7
_newlib_commit=8ba4275b83ec27529f67e0d477611fa6d8d6e6bd

source=("git+https://sourceware.org/git/binutils-gdb.git#commit=${_binutils_commit}"
        "git+https://gcc.gnu.org/git/gcc.git#commit=${_gcc_commit}"
        "git+https://sourceware.org/git/newlib-cygwin.git#commit=${_newlib_commit}"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
	local repository entry
	local -a entries

	# GCC diagnoses the undeclared memcpy/memset calls in this startup code.
	if ! grep -q '^#include <string.h>' "${srcdir}/newlib-cygwin/libgloss/m68k/cf-crt1.c"; then
		sed -i '/^#include <stdlib.h>/a #include <string.h>' \
			"${srcdir}/newlib-cygwin/libgloss/m68k/cf-crt1.c"
	fi
	# Match the semihosting symbol exported by cf-hosted.S/fido-hosted.S.
	sed -i 's/extern int __io_hosted (/extern int __hosted (/' \
		"${srcdir}/newlib-cygwin/libgloss/m68k/io.h"

	rm -rf "${srcdir:?}/combined"
	mkdir -p "${srcdir}/combined" "${srcdir}/obj-combined"

	# Real directories allow merging; files are symlinks to the source trees.
	# Later trees override earlier ones: GCC > binutils > newlib.
	for repository in newlib-cygwin binutils-gdb gcc; do
		entries=()
		for entry in "${srcdir}/${repository}/"* \
		             "${srcdir}/${repository}/".[!.]* \
		             "${srcdir}/${repository}/"..?*; do
			[[ -e $entry || -L $entry ]] || continue
			[[ ${entry##*/} == .git ]] && continue
			entries+=("$entry")
		done
		cp -rs --remove-destination "${entries[@]}" "${srcdir}/combined/" || return
	done
}

build()
{
	cd "${srcdir}"/obj-combined || return
	CFLAGS=${CFLAGS//-Werror=format-security/}
	CXXFLAGS=${CXXFLAGS//-Werror=format-security/}
	# Host architecture and hardening flags must not reach bare-metal libraries.
	export CFLAGS_FOR_TARGET='-O2 -g'
	export CXXFLAGS_FOR_TARGET='-O2 -g'

	"${srcdir}"/combined/configure --prefix=/usr --libexecdir=/usr/lib --target=${_target} --enable-languages=c,c++ --disable-libstdcxx-pch \
	--with-newlib --with-system-zlib --disable-nls --enable-plugins --enable-deterministic-archives --enable-relro --enable-__cxa_atexit \
	--enable-linker-build-id --enable-checking=release --disable-libcc1 --disable-libssp --disable-libunwind-exceptions --disable-source-highlight --disable-werror \
	--with-python=/usr/bin/python --without-debuginfod --without-guile --without-babeltrace --without-intel-pt --disable-gprofng

	make
}

package()
{
	cd "${srcdir}/obj-combined" || return
	make install DESTDIR="${pkgdir}" -j1
	rm -rf "${pkgdir:?}"/usr/share
	rm -rf "${pkgdir:?}"/usr/include
	rm -rf "${pkgdir:?}"/usr/lib/libcc1.*
	rm -rf "${pkgdir:?}"/usr/lib/bfd-plugins
	find "${pkgdir}" -name '*.py' -delete 


	# Only the native x86-64 tools may be stripped with the host strip.
	local filename description
	while IFS= read -r -d '' filename; do
		description=$(LC_ALL=C readelf -h "$filename" 2>/dev/null) || continue
		if [[ $description == *'Machine:'*'Advanced Micro Devices X86-64'* &&
		      ( $description == *'Type:'*'EXEC ('* || $description == *'Type:'*'DYN ('* ) ]]; then
			strip --strip-unneeded "$filename" || return
		fi
	done < <(find "$pkgdir" -type f -print0)

	# Group both suffixes so -type and -exec apply to objects and archives.
	find "${pkgdir}/usr/lib/gcc/${_target}" "${pkgdir}/usr/${_target}/lib" \
		-type f \( -name '*.o' -o -name '*.a' \) \
		-exec "${pkgdir}/usr/bin/${_target}-strip" -g {} +
}
