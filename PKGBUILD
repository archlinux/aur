# $Id$
# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname='mingw-w64-qca-qt5'
pkgver=2.1.3
pkgrel=2
pkgdesc='Qt Cryptographic Architecture'
arch=('any')
url='https://userbase.kde.org/QCA'
license=(LGPL)
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://download.kde.org/stable/qca/$pkgver/src/qca-$pkgver.tar.xz")
md5sums=('5019cc29efcf828681cd93164238ce26')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  true
}

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTS=OFF \
      -DQCA_INSTALL_IN_QT_PREFIX=ON \
      -DOPENSSL_INCLUDE_DIR=/usr/${_arch}/include/openssl-1.0 \
      -DOPENSSL_SSL_LIBRARY=/usr/${_arch}/lib/openssl-1.0/libssl.dll.a \
      -DOPENSSL_CRYPTO_LIBRARY=/usr/${_arch}/lib/openssl-1.0/libcrypto.dll.a \
      ../qca-$pkgver
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    # strip binaries
    find "${pkgdir}/usr/${_arch}/lib" -maxdepth 1 -name "*.dll" -exec rm {} \;
    [ "$NO_STATIC_EXECUTABLES" -a "${_config##*=}" = static -o "$NO_EXECUTABLES" ] && \
      find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec rm {} \; || \
      find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -exec ${_arch}-strip -g {} \;
    [[ -d "${pkgdir}/usr/${_arch}/lib/qt/bin/" ]] && \
      find "${pkgdir}/usr/${_arch}/lib/qt/bin/" -exec strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}/lib/" -iname "*.so.$pkgver" -exec strip --strip-unneeded {} \;
    # remove manual
    rm -r "${pkgdir}/usr/${_arch}/share"
    popd
  done
}


