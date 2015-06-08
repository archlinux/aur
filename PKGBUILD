# $Id: PKGBUILD 177015 2013-02-04 08:35:17Z jgc $
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=lib32-libmpeg2
_pkgname=libmpeg2
pkgver=0.5.1
pkgrel=2
pkgdesc="Library for decoding MPEG-1 and MPEG-2 video streams, lib32."
arch=('x86_64')
url="http://libmpeg2.sourceforge.net/"
depends=('glibc' 'libmpeg2')
makedepends=('lib32-sdl' 'lib32-libxv')
optdepends=('lib32-sdl: required for mpeg2dec'
            'lib32-libxv: required for mpeg2dec')
source=("http://libmpeg2.sourceforge.net/files/${_pkgname}-${pkgver}.tar.gz"
        "libmpeg2-0.5.1-gcc4.6.patch")
license=('GPL2')
options=(!libtool)

md5sums=('0f92c7454e58379b4a5a378485bbd8ef'
         '8b36660297e6ffde6aa9733136bff405')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/libmpeg2-0.5.1-gcc4.6.patch"

  sed '/AC_PATH_XTRA/d' -i configure.ac
  autoreconf --force --install
}

build(){
	cd "${srcdir}/${_pkgname}-${pkgver}"
	export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	
	./configure --prefix=/usr --enable-shared --disable-static --libdir=/usr/lib32 --libexecdir=/usr/lib32
	make OPT_CFLAGS="${CFLAGS}" 	MPEG2DEC_CFLAGS="${CFLAGS}" 	LIBMPEG2_CFLAGS=""
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cd "$pkgdir/usr"
  rm -rf {bin,include,share}/
}
