# $Id$
# Maintainer: Martchus <martchus@gmx.net>

_pkg_arch=x86-64
_android_arch=x86_64
_android_platform_arch=arch-x86_64
_pkgname=openssl
_ver=1.1.1p
_patchname=15-android_conf

pkgname=android-$_pkg_arch-$_pkgname
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
pkgrel=1
pkgdesc="The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (Android, $_pkg_arch)"
arch=('any')
url='https://www.openssl.org'
license=('custom:BSD')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
depends=('android-sdk' 'android-ndk')
makedepends=('android-environment' 'android-sdk-build-tools')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"{,.asc})
sha256sums=('bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C')

build() {
  cd "${srcdir}/${_pkgname}-${_ver}"
  source android-env ${_pkg_arch}
  export PATH="${ANDROID_TOOLCHAIN}/bin:${PATH}"

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
  make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" SHLIB_VERSION_NUMBER= SHLIB_EXT=_1_1.so build_libs
}

package() {
  cd "$srcdir/$_pkgname-$_ver"
  source android-env ${_pkg_arch}
  export PATH="$ANDROID_TOOLCHAIN:$PATH"

  # install header files, libraries and license
  for lib in libcrypto{.a,_1_1.so} libssl{.a,_1_1.so}; do
    install -D -m0644 $lib "$pkgdir/${ANDROID_PREFIX_LIB}/$lib"
  done
  for pc in libcrypto.pc libssl.pc openssl.pc; do
    install -D -m0644 $pc "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/$pc"
  done
  mkdir -p "$pkgdir/${ANDROID_PREFIX_INCLUDE}"
  cp -r include/openssl "$pkgdir/${ANDROID_PREFIX_INCLUDE}"
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # add symlinks for dynamic libs with SHLIB_EXT so build scripts can find them under their usual names
  for lib in libcrypto libssl; do
    ln -s "${lib}_1_1.so" "${pkgdir}/${ANDROID_PREFIX_LIB}/${lib}.so"
  done

  # strip binaries
  find "$pkgdir" -name 'lib*.so' -type f -exec "$ANDROID_STRIP" --strip-unneeded {} \;
  find "$pkgdir" -name 'lib*.a' -type f -exec "$ANDROID_STRIP" -g {} \;
}
