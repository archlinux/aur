# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_android_arch=aarch64
pkgname=android-$_android_arch-qt6-serialbus
_qtver=6.4.2
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Qt module for general purpose serial bus access (android)'
depends=('android-aarch64-qt6-serialport')
makedepends=('android-cmake' 'qt6-base' 'qt6-serialbus' 'ninja' 'java-environment-openjdk=8')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(android-${_android_arch}-qt6)
_pkgfqn="qtserialbus-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('604013657c7327899aa50748deb4bcb5e545ab37ff4964795b9e6f617d48bf1b')

build() {
  source android-env ${_android_arch}
  android-${_android_arch}-cmake -G Ninja -B build-$_android_arch -S $_pkgfqn \
    -DCMAKE_FIND_ROOT_PATH="${ANDROID_PREFIX}" \
    -DQT_BINARY_DIR=${ANDROID_PREFIX_BIN} \
    -DQT_INCLUDE_DIRS_NO_SYSTEM=ON \
    -DQT_HOST_PATH=/usr \
    -DANDROID_SDK_ROOT=${ANDROID_HOME} \
    -DANDROID_NDK_ROOT=${ANDROID_NDK_HOME} \
    -DANDROID_STL="c++_shared" \
    -DFEATURE_pkg_config=ON
  cmake --build build-$_android_arch
}

package() {
  DESTDIR="$pkgdir" cmake --install build-$_android_arch

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/${ANDROID_PREFIX}" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
  find ${pkgdir}/${ANDROID_PREFIX} -type f -name 'lib*.a' -exec ${ANDROID_STRIP} -g {} \;
  [[ -d "${pkgdir}/${ANDROID_PREFIX}/share/doc" ]] && rm -r "${pkgdir}/${ANDROID_PREFIX}/share/doc" || true

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/android-$_android_arch-qt6-base "$pkgdir"/usr/share/licenses/$pkgname

}
