# Maintainer: Evgeny Shvits <tony.darko@gmail.com>

pkgname=stm8-binutils-gdb
pkgver=20180304
_binutils_ver=2.30
_gdb_ver=8.1
pkgrel=1
pkgdesc='Binutils and GDB for the STM8 target'
arch=('x86_64')
url='http://www.gnu.org/software/binutils/'
license=('GPL')
depends=(zlib xz mpfr guile2.0 python)

source=(
	"https://ftp.gnu.org/gnu/binutils/binutils-${_binutils_ver}.tar.xz"
	"https://ftp.gnu.org/gnu/gdb/gdb-${_gdb_ver}.tar.xz"
	"https://netix.dl.sourceforge.net/project/stm8-binutils-gdb/stm8-binutils-gdb-sources-2018-03-04.tar.gz"
	"gdb_fix_python37.patch"
	)
noextract=(
	"binutils-${_binutils_ver}.tar.xz"
	"gdb-${_gdb_ver}.tar.xz"
	)
md5sums=('ffc476dd46c96f932875d1b2e27e929f'
         'f46487561f9a16916a8102316f7fd105'
         '53e0630afa62504050ac3a82b5a14b91'
         'a8e737772afafa68bd6bec0541942140')

prepare() {
	cd "stm8-binutils-gdb-sources"
	mkdir -p binutils-$_binutils_ver
	tar -xf ../gdb-${_gdb_ver}.tar.xz --strip-components=1 --directory=binutils-${_binutils_ver}
	tar -xf ../binutils-${_binutils_ver}.tar.xz
	
	for f in ./binutils_patches/*.patch
	do
		patch -N -p 1 -d binutils-2.30 <$f
	done
	
	# limits.h error fix
	cd binutils-${_binutils_ver}
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
	
	patch -N -p1 < ../../gdb_fix_python37.patch
}

build() {
	cd "stm8-binutils-gdb-sources/binutils-${_binutils_ver}"
	
	./configure --host=$(.config.guess) --target=stm8-none-elf32 --prefix=/usr --program-prefix=stm8-

	make
}

package() {
	cd "stm8-binutils-gdb-sources/binutils-${_binutils_ver}"
	
	make DESTDIR="${pkgdir}" install
	
	cd ${pkgdir}
	rm -rf usr/include
	rm -rf usr/share/{gdb,info,locale}
}

