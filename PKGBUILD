pkgname=mingw-w64-sonnet
pkgver=5.31.0
pkgrel=1
arch=(any)
pkgdesc="Spelling framework for Qt5 (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-qt5-base)
groups=(mingw-w64-kf5)
makedepends=(mingw-w64-cmake mingw-w64-extra-cmake-modules mingw-w64-qt5-tools mingw-w64-aspell mingw-w64-hunspell "sonnet>=5.22.0")
optdepends=("mingw-w64-aspell: spell checking via aspell"
"mingw-w64-hunspell: spell checking via hunspell")
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/sonnet-${pkgver}.tar.xz")
md5sums=('11cef5b5016def5298b64e2ce561a8b5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd sonnet-$pkgver
	sed -i 's,$<TARGET_FILE:KF5::parsetrigrams>,/usr/bin/parsetrigrams,' data/CMakeLists.txt
}

build() {
	cd sonnet-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
      -DBUILD_TESTING=OFF \
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
