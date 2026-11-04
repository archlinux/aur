# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

_target=m68k-elf
pkgname=$_target-toolchain
pkgver=20261104
pkgrel=1
pkgdesc="A complete gcc/binutils/newlib toolchain for $_target"
depends=('bash' 'zlib' 'zstd' 'gmp' 'mpfr' 'libmpc' 'libisl'
         'expat' 'ncurses' 'readline' 'python' 'xz' 'xxhash')
url="https://www.gnu.org"
conflicts=("$_target-gcc" "$_target-binutils" "$_target-newlib" "$_target-gdb")
arch=('x86_64')
makedepends=('git')
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later' 'GPL-2.0-or-later' 'BSD-3-Clause' 'custom')
options=('!strip' '!debug' '!lto' 'staticlibs')
_binutils_commit=cd679f551a3961ba3ac17a8f9e48d86323207b7c
_gcc_commit=096da3d6e3814aeab097a091efb66908f1789821
_newlib_commit=b097f95233d26da7af6887798297d1efadb75370

source=("git+https://sourceware.org/git/binutils-gdb.git#commit=${_binutils_commit}"
        "git+https://gcc.gnu.org/git/gcc.git#commit=${_gcc_commit}"
        "git+https://sourceware.org/git/newlib-cygwin.git#commit=${_newlib_commit}"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
	# GCC diagnoses the undeclared memcpy/memset calls in this startup code.
	if ! grep -q '^#include <string.h>' "${srcdir}/newlib-cygwin/libgloss/m68k/cf-crt1.c"; then
		sed -i '/^#include <stdlib.h>/a #include <string.h>' \
			"${srcdir}/newlib-cygwin/libgloss/m68k/cf-crt1.c"
	fi
	# Match the semihosting symbol exported by cf-hosted.S/fido-hosted.S.
	sed -i 's/extern int __io_hosted (/extern int __hosted (/' \
		"${srcdir}/newlib-cygwin/libgloss/m68k/io.h"

	# Start from scratch so stale config caches never survive a commit bump.
	rm -rf "${srcdir:?}/combined" "${srcdir:?}/obj-combined"
	mkdir -p "${srcdir}/combined" "${srcdir}/obj-combined"

	# Symlink the top-level entries of each tree; GCC > binutils > newlib.
	cd "${srcdir}/combined" || return
	ln -s ../newlib-cygwin/* . || return
	ln -sf ../binutils-gdb/* . || return
	ln -sf ../gcc/* . || return

	# include/ differs between gcc and binutils, so merge it per entry.
	rm include && mkdir include || return
	_merge_links "${srcdir}/binutils-gdb/include" include || return
	_merge_links "${srcdir}/gcc/include" include || return
}

# Symlink every entry of $1 into directory $2. A directory that exists in
# both becomes a real directory and is merged recursively; otherwise $1 wins.
_merge_links() {
	local source=$1 dest=$2 entry name old
	for entry in "$source"/*; do
		name=${entry##*/}
		if [[ -d $entry && -d $dest/$name ]]; then
			if [[ -L $dest/$name ]]; then
				old=$(readlink -f "$dest/$name")
				rm "$dest/$name" && mkdir "$dest/$name" || return
				_merge_links "$old" "$dest/$name" || return
			fi
			_merge_links "$entry" "$dest/$name" || return
		else
			ln -sfn "$entry" "$dest/$name" || return
		fi
	done
}

build()
{
	cd "${srcdir}"/obj-combined || return
	CFLAGS=${CFLAGS//-Werror=format-security/}
	CXXFLAGS=${CXXFLAGS//-Werror=format-security/}
	# Host architecture and hardening flags must not reach bare-metal libraries.
	# Per-function/data sections let users drop unused library code with --gc-sections.
	export CFLAGS_FOR_TARGET='-O2 -g -ffunction-sections -fdata-sections'
	export CXXFLAGS_FOR_TARGET='-O2 -g -ffunction-sections -fdata-sections'

	"${srcdir}"/combined/configure --prefix=/usr --libexecdir=/usr/lib --target=${_target} --enable-languages=c,c++ --disable-libstdcxx-pch \
	--with-newlib --with-system-zlib --disable-nls --enable-plugins --enable-deterministic-archives --enable-__cxa_atexit \
	--enable-linker-build-id --enable-checking=release --disable-libcc1 --disable-libssp --disable-source-highlight --disable-werror \
	--with-python=/usr/bin/python --with-system-readline --with-gdb-datadir=/usr/share/${_target}-gdb \
	--without-debuginfod --without-guile --without-babeltrace --without-intel-pt --disable-gprofng

	make
}

package()
{
	cd "${srcdir}/obj-combined" || return
	make install DESTDIR="${pkgdir}" -j1
	# Drop files that conflict with the host toolchain; keep gdb's own data dir.
	rm -rf "${pkgdir:?}"/usr/share/{info,man,locale}
	rm -rf "${pkgdir:?}"/usr/share/gcc-*
	rm -rf "${pkgdir:?}"/usr/include
	rm -rf "${pkgdir:?}"/usr/lib/bfd-plugins
	# libstdc++ auto-load scripts point at the pretty printers removed above.
	find "${pkgdir}/usr/${_target}/lib" -name '*-gdb.py' -delete

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
