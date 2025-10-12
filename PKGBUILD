# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=kirigami
pkgname=mingw-w64-${_pkgname}
pkgver=6.19.0
pkgrel=1
pkgdesc="A QtQuick based components set (mingw-w64)"
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(mingw-w64-crt mingw-w64-qt6-{declarative,shadertools,svg,5compat})
makedepends=(mingw-w64-gcc mingw-w64-extra-cmake-modules qt6-base qt6-declarative qt6-tools qt6-shadertools ninja)
groups=(mingw-w64-kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('8c6685dde55f001cc621b38c61486d0e9e2ef7fb1d502ca5dd049112229ea7cc'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=x86_64-w64-mingw32

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -G Ninja -B build-$_arch -S $_pkgname-$pkgver \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_TESTING=OFF \
      -DBUILD_QCH=OFF
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" VERBOSE=1 cmake --install build-$_arch
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a'   -exec ${_arch}-strip -g {} \;
  done
}
