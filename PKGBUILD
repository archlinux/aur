# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Arthur Darcet <arthur.darcet at m4x.org>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>

_pkgname=libiconv
_pkg_arch=x86
_android_arch=x86
_android_platform=22

pkgname=android-$_pkg_arch-$_pkgname
pkgver=1.18
pkgrel=1
pkgdesc="Provides libiconv.so and libcharset.so (Android $_pkg_arch)"
arch=('any')
url='http://www.gnu.org/software/libiconv/'
license=('LGPL')
makedepends=('android-ndk' 'android-configure')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("http://ftp.gnu.org/pub/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3b08f5f4f9b4eb82f151a7040bfd6fe6c6fb922efe4b1659c66ea933276965e8')
options=(!libtool !buildflags staticlibs !strip !emptydirs)

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  source android-env ${_pkg_arch}

  android-${_pkg_arch}-configure
  make $MAKEFLAGS
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}
  source android-env ${_pkg_arch}

  make DESTDIR="$pkgdir" install
  rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
  ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
  ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
