# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Arthur Darcet <arthur.darcet at m4x.org>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>

_pkgname=libiconv
_pkg_arch=x86
_android_arch=x86
_android_platform=22

pkgname=android-$_pkg_arch-$_pkgname
pkgver=1.16
pkgrel=2
pkgdesc="Provides libiconv.so and libcharset.so (Android $_pkg_arch)"
arch=('any')
url='http://www.gnu.org/software/libiconv/'
license=('LGPL')
makedepends=('android-ndk' 'android-configure')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("http://ftp.gnu.org/pub/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04')
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
