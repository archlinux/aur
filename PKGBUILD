_pkgname=kinit
pkgname=mingw-w64-$_pkgname
pkgver=5.45.0
pkgrel=2
arch=(any)
pkgdesc="Process launcher to speed up launching KDE applications (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-kio)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-extra-cmake-modules mingw-w64-qt5-tools)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-${pkgver}.tar.xz"{,.sig}
        "org.kde.klauncher5.service")
sha256sums=('5050b36c80e9163df7dbce2c55948e135cf3db1c140238adf51b9901cce5185e'
            'SKIP'
            '5b242720243f720221284489d739b9caa3b25717c8883bfa0f1883fc7d87edf6')
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
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
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
    install -m644 -D -t "${pkgdir}/usr/${_arch}/share/dbus-1/services" "${srcdir}/org.kde.klauncher5.service"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
