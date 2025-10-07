# $Id$
# Maintainer: Martchus <martchus@gmx.net>

_pkg_arch=aarch64
_android_arch=arm64-v8a
_android_platform_arch=arch-arm64
_pkgname=openssl
_pkgver=3.6.0

pkgname=android-$_pkg_arch-$_pkgname
# use a pacman compatible version scheme
pkgver=${_pkgver/[a-z]/.${_pkgver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (Android, $_pkg_arch)"
arch=('any')
url='https://www.openssl.org'
license=('Apache-2.0')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
depends=('android-sdk' 'android-ndk')
makedepends=('android-environment' 'android-sdk-build-tools')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("https://github.com/openssl/openssl/releases/download/openssl-${pkgver}/openssl-${pkgver}.tar.gz"{,.asc})
sha256sums=('b6a5f44b7eb69e3fa35dbf15524405b44837a481d43d81daddde3ff21fcbb8e9'
            'SKIP')
validpgpkeys=('EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5'
              'BA5473A2B0587B07FB27CF2D216094DFD0CB81EF')

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

  # create symlinks for library names expected by Qt 6
  for lib_name in crypto ssl; do
    ln -vrs "$pkgdir/${ANDROID_PREFIX_LIB}/lib${lib_name}.so" "$pkgdir/${ANDROID_PREFIX_LIB}/lib${lib_name}_3.so"
  done
}
