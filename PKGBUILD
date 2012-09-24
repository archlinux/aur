# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=readline
pkgname=libx32-$_pkgbasename
_basever=6.2
_patchlevel=004 #prepare for some patches
pkgver=$_basever.$_patchlevel
pkgrel=1.1
pkgdesc="GNU readline library (x32 ABI)"
arch=(x86_64)
url="http://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('libx32-glibc' 'libx32-ncurses' $_pkgbasename)
makedepends=('gcc-multilib-x32')
source=(http://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz)
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
		source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//./}-$(printf "%03d" $p){,.sig})
    done
fi
md5sums=('67948acb2ca081f23359d0256e9a271c'
         '83287d52a482f790dfb30ec0a8746669'
         '8e6a51e2e0e6e45a82752e3692c111ac'
         '0665020ea118e8434bd145fb71f452cc'
         '285361ca6d48c51ae2428157e174e812'
         'c9d5d79718856e711667dede87cb7622'
         '4437205bb1462f5f32e4812b8292c675'
         'c08e787f50579ce301075c523fa660a4'
         '7e39cad1d349b8ae789e4fc33dbb235f')

build() {
  cd ${srcdir}/${_pkgbasename}-$_basever

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
	  msg "applying patch readline${_basever//./}-$(printf "%03d" $p)"
	  patch -Np0 -i $srcdir/readline${_basever//./}-$(printf "%03d" $p)
  done

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf

  ./configure --prefix=/usr --libdir=/usr/libx32
  make SHLIB_LIBS=-lncurses
}

package() {
  cd ${srcdir}/${_pkgbasename}-$_basever

  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
