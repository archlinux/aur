# $Id$
# Maintainer: Martchus <martchus@gmx.net>

_pkg_arch=armv7a-eabi
_android_arch=armeabi-v7a
_android_platform_arch=arch-arm
_pkgname=openssl
_pkgver=3.2.0

pkgname=android-$_pkg_arch-$_pkgname
# use a pacman compatible version scheme
pkgver=${_pkgver/[a-z]/.${_pkgver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (Android, $_pkg_arch)"
arch=('any')
url='https://www.openssl.org'
license=('Apache')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
depends=('android-sdk' 'android-ndk')
makedepends=('android-environment' 'android-sdk-build-tools')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("https://www.openssl.org/source/openssl-${_pkgver}.tar.gz"{,.asc})
sha256sums=('14c826f07c7e433706fb5c69fa9e25dab95684844b4c962a2cf1bf183eb4690e'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'
              'A21FAB74B0088AA361152586B8EF1A6BA9DA2D5C'
              'EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  source android-env ${_pkg_arch}
  export PATH="${ANDROID_TOOLCHAIN}/bin:${PATH}"
  export LIBDIR=lib

  ./Configure \
    --prefix="${ANDROID_PREFIX}" \
    --openssldir="${ANDROID_PREFIX}" \
    -U__ANDROID_API__ \
    -D__ANDROID_API__="${ANDROID_MINIMUM_PLATFORM}" \
    -Wl,--no-allow-shlib-undefined \
    -Wl,--no-undefined \
    no-stdio \
    no-ui-console \
    threads \
    shared \
    android-${_android_platform_arch##arch-}

  # get rid of debug printing so the library doesn't depend on stdio (no-stdio and no-ui are not entirely sufficient)
  sed -i -e 's/\#define TEST_ENG_OPENSSL_RC4_P_INIT//' crypto/engine/eng_openssl.c

  # build only libraries
  # note: Setting SHLIB_EXT in accordance with qtbase/src/network/ssl/qsslsocket_openssl_symbols.cpp to avoid loading
  #       system library.
  make depend
  make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" SHLIB_VERSION_NUMBER= SHLIB_EXT=.so build_libs
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  source android-env ${_pkg_arch}
  export PATH="$ANDROID_TOOLCHAIN:$PATH"
  export LIBDIR=lib

  # install header files, libraries and license
  for lib in libcrypto{.a,.so} libssl{.a,.so}; do
    install -D -m0644 $lib "$pkgdir/${ANDROID_PREFIX_LIB}/$lib"
  done
  for pc in libcrypto.pc libssl.pc openssl.pc; do
    install -D -m0644 $pc "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/$pc"
  done
  mkdir -p "$pkgdir/${ANDROID_PREFIX_INCLUDE}"
  cp -r include/openssl "$pkgdir/${ANDROID_PREFIX_INCLUDE}"

  # strip binaries
  find "$pkgdir" -name 'lib*.so' -type f -exec "$ANDROID_STRIP" --strip-unneeded {} \;
  find "$pkgdir" -name 'lib*.a' -type f -exec "$ANDROID_STRIP" -g {} \;
}
