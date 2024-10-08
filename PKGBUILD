# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_android_arch=x86-64
pkgname=android-$_android_arch-qt6-declarative
_qtver=6.8.0
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for QML and JavaScript languages (android)'
depends=('android-x86-64-qt6-base')
makedepends=('android-cmake' 'qt6-declarative' 'qt6-shadertools' 'ninja' 'python')
optdepends=('qt6-declarative: development tools')
conflicts=('android-x86-64-qt6-quickcontrols2')
provides=('android-x86-64-qt6-quickcontrols2')
replaces=('android-x86-64-qt6-quickcontrols2')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(android-${_android_arch}-qt6)
_pkgfqn="qtdeclarative-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Exclude-qmltime-when-cross-compiling.patch')
sha256sums=('3b41a36b42e919a3aa0da1f71107591504200f41707bee2ad8e8d4f99b5644c2'
            'ff795df75cd5fa2c53cdf59355b23722979b612dd6a00536143e421791e391aa')

prepare () {
  cd $_pkgfqn

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

build() {
  export PATH=/usr/lib/jvm/java-17-openjdk/bin:$PATH
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

