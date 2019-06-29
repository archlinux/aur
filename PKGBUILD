_pkgname=kross
pkgname=mingw-w64-$_pkgname
pkgver=5.45.0
pkgrel=1
arch=(any)
pkgdesc="Multi-language application scripting (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-kparts)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-extra-cmake-modules mingw-w64-qt5-tools)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/portingAids/$_pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('1647a4d8418bd2c3921ed98185a755a482d9b0f7c718871ca645da6499191ee9'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $_pkgname-$pkgver
  # remove doctools stuff
  sed -e '/find_package.*KF5DocTools/d;/kdoctools_install/d' -i CMakeLists.txt
}

build() {
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
      -DBUILD_TESTING=OFF \
      -DMEINPROC5_EXECUTABLE:PATH="/usr/bin/meinproc5" \
      -DCHECKXML5_EXECUTABLE:PATH="/usr/bin/checkXML5" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -rf "$pkgdir/usr/${_arch}/share"
  done
}
