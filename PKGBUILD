_pkgname=kio
pkgname=mingw-w64-$_pkgname
pkgver=5.45.0
pkgrel=3
arch=(any)
pkgdesc="Resource and network access abstraction (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-solid mingw-w64-kjobwidgets mingw-w64-kbookmarks mingw-w64-libxslt mingw-w64-qt5-script) # TODO: mingw-w64-kwallet dependency
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-extra-cmake-modules mingw-w64-qt5-tools mingw-w64-wine)
optdepends=('mingw-w64-kio-extras: extra protocols support (sftp, fish and more)' 'kdoctools: for the help kioslave'
            'mingw-w64-knetattach: to add new kio-remote entries')
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-${pkgver}.tar.xz"{,.sig})
sha256sums=('3e7512e819fe1831b15981641dba26a7dcbbdbccd79cbf076ceedae8e4116b15'
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
      -DKDE_INSTALL_DBUSDIR="/usr/${_arch}/share/dbus-1" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
