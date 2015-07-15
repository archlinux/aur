# Maintainer: Johnny Halfmoon <jhalfmoon@milksnot.com>

pkgname=arm-none-eabi-gdb-linaro
_relver=7.8
_relshortdate=14.09
_reldate=20${_relshortdate}
_relverdate=${_relver}-${_reldate}
# This is how I want to define the pkgver, but the AUR doesn't understand it
#pkgver=${_relver}_${_reldate//-/_}
pkgver=7.8_2014.09
pkgrel=1
pkgdesc="Linaro GDB is a branch of FSF GDB that contains ARM focused features and patches."
arch=(i686 x86_64)
url="https://releases.linaro.org/"
license=('GPL3')
groups=('arm-none-eabi-toolchain')
depends=('ncurses' 'expat' 'python2')
makedepends=('texinfo')
optdepends=('openocd: for debugging JTAG targets')
provides=('arm-none-eabi-gdb')
conflicts=('cross-arm-none-eabi-gdb' 'arm-none-eabi-gdb')
options=(!libtool !emptydirs)
source=(https://releases.linaro.org/${_relshortdate}/components/toolchain/gdb-linaro/gdb-linaro-${_relverdate}.tar.xz)
_basedir=gdb-linaro-${_relverdate}

build() {
  cd ${srcdir}/${_basedir}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir build
  cd build
  ../configure --target=arm-none-eabi \
               --prefix=/usr \
               --datarootdir=/usr/share/arm-none-eabi-gdb \
               --enable-multilib \
               --enable-interwork \
               --with-system-readline \
               --disable-nls
  make
}

package() {
  cd ${srcdir}/${_basedir}/build
  make DESTDIR=${pkgdir} install

	# We don't want these files in a cross version
  rm -f ${pkgdir}/usr/lib/libiberty.a
	rm -rf ${pkgdir}/usr/share/info
	rm -rf ${pkgdir}/usr/share/gdb
	rm -rf ${pkgdir}/usr/include/gdb
}

# vim: set ts=2 sw=2 ft=sh noet:
sha256sums=('fbbe96b8d0debf7c2d8c9a4a6c7ca0ba87d536e43289f81c4af56f95e5f7b5ea')
