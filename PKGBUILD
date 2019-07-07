_pkgname=kglobalaccel
pkgname=mingw-w64-$_pkgname
pkgver=5.45.0
pkgrel=2
arch=(any)
pkgdesc="Add support for global workspace shortcuts (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-kconfig mingw-w64-kcrash mingw-w64-kdbusaddons)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-extra-cmake-modules mingw-w64-qt5-tools)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "fix-moc.patch")
sha256sums=('d5336124af365f784e3753264828f43a71f1e7b00780bb7df6bafadcdbe595c7'
            'SKIP'
            '6da3377088a6d8ac2f01b76a6cc4e5d78b1c3245d8449b0681d2367355826647')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${_pkgname}-$pkgver
  patch -Np1 -i ../fix-moc.patch
}

build() {
  cd ${_pkgname}-$pkgver
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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
