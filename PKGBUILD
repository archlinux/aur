# Maintainer: Huayu Zhang <zhanghuayu.dev@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Daniel Kozak <kozzi11@gmail.com>

pkgname=gcc-11
pkgver=11.1.0
pkgrel=1
pkgdesc='The GNU Compiler Collection'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
#makedepends=(binutils doxygen git libmpc python)
makedepends=(binutils git libmpc python)
checkdepends=(dejagnu inetutils)
#options=(!emptydirs !lto)
source=(https://sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.xz)
sha256sums=("4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf")
_ins_path=/opt/gcc-11

build() {
	CFLAGS=${CFLAGS/-Werror=format-security/}
	CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
	cd gcc-${pkgver}
	
	if [ -d "build" ] 
	then
		echo "exist"
	else
		mkdir build
	fi
	if [ -d "${_ins_path}" ] 
	then
		sudo rm -rf ${_ins_path}
		sudo mkdir ${_ins_path}
	else
		sudo mkdir ${_ins_path}
	fi
	
	cd build
	../configure \
	--prefix=/opt/gcc-11 \
	--enable-languages=c,c++ \
	--disable-build-format-warnings \
	--disable-werror

	make -j$(nroc)
	# make -j$(nproc) all-target-libgcc
}

package() {
	 cd gcc-${pkgver}
	 cd "build"
     make install-gcc DESTDIR=$pkgdir
     make install-target-libgcc DESTDIR=$pkgdir
     # Remove conflicting files
     rm -rf $pkgdir/usr/share/info
     rm -rf $pkgdir/usr/share/man/man7
	 echo "
	 add PATH by YOURSELF!!!
	 echo 'export PATH=/opt/gcc-11/bin:$PATH' >> /home/$(whoami)/.zshrc"
}

