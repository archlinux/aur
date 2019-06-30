_pkgname=kauth
pkgname=mingw-w64-$_pkgname
pkgver=5.45.0
pkgrel=3
pkgdesc='Abstraction to system policy and authentication features (mingw-w64)'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(mingw-w64-kcoreaddons)
#mingw-w64-polkit-qt5
makedepends=(mingw-w64-extra-cmake-modules mingw-w64-qt5-tools)
#mingw-w64-clang mingw-w64-sip
optdepends=('python-pyqt5: for the Python bindings')
groups=(mingw-w64-kf5)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('d1149f2f3a653608519bdd31f2832b85c1806a8a981334afa5e07089e77ad7c8'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_LIBEXECDIR=lib \
      -DBUILD_TESTING=OFF \
      ../$_pkgname-$pkgver
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    popd
  done
}
