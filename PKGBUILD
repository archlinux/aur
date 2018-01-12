# $Id$
# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname='mingw-w64-qca-qt5'
pkgver=2.1.3
pkgrel=3
pkgdesc='Qt Cryptographic Architecture (mingw-w64)'
arch=('any')
url='https://userbase.kde.org/QCA'
license=(LGPL)
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://download.kde.org/stable/qca/$pkgver/src/qca-$pkgver.tar.xz"
        qca-openssl-1.1.patch)
sha256sums=('003fd86a32421057a03b18a8168db52e2940978f9db5ebbb6a08882f8ab1e353'
            'b1505bc313fd2f4e350cd4c94af69256c901afa419ae6700b208cb6e40e6926d')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd qca-$pkgver
  patch -p1 -i ../qca-openssl-1.1.patch # Fix build with OpenSSL 1.1 https://bugs.kde.org/show_bug.cgi?id=379810
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


