# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

pkgname=mingw-w64-kcoreaddons
pkgver=5.76.0
pkgrel=2
arch=(any)
pkgdesc="Addons to QtCore (mingw-w64)"
license=("LGPL")
depends=(mingw-w64-qt5-base shared-mime-info)
groups=(mingw-w64-kf5)
makedepends=("mingw-w64-extra-cmake-modules>=${pkgver%.*}" mingw-w64-qt5-tools)
options=(staticlibs !strip !buildflags)
url="https://community.kde.org/Frameworks"
source=("http://download.kde.org/stable/frameworks/${pkgver%.*}/kcoreaddons-${pkgver}.tar.xz"{,.sig})
sha256sums=('fbab3e3e18f42922ecdc50138ed31f62007cafa902b959d89b1233b5557282d6'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd kcoreaddons-$pkgver
	find . -type f -exec sed -i "s,LM.h,lm.h,g" {} \;
	find . -type f -exec sed -i "s,Userenv.h,userenv.h,g" {} \;
	find . -type f -exec sed -i "s,Shlobj.h,shlobj.h,g" {} \;
}

build() {
	cd kcoreaddons-$pkgver
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
