# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=cppunit
_android_arch=x86
pkgname=android-$_android_arch-$_pkgname
pkgver=1.15.1
pkgrel=1
pkgdesc="A C++ unit testing framework (Android, $_android_arch)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/cppunit"
license=('LGPL')
depends=('android-ndk')
makedepends=('android-configure')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
options=(!strip !buildflags !libtool staticlibs !emptydirs)
source=("https://dev-www.libreoffice.org/src/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7')

build() {
  source android-env ${_android_arch}
  cd $_pkgname-$pkgver
  android-${_android_arch}-configure \
    --enable-shared=yes \
    --enable-static=yes
  make V=1 $MAKEFLAGS
}

package() {
  source android-env ${_android_arch}
  cd $_pkgname-$pkgver

  make DESTDIR="${pkgdir}" install install-data

  rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
  ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
  ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
