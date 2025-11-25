# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_android_arch=aarch64
pkgname=android-$_android_arch-qt6-declarative
_qtver=6.10.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Classes for QML and JavaScript languages (android)'
depends=('android-aarch64-qt6-base')
makedepends=('android-cmake' 'qt6-declarative' 'qt6-shadertools' 'ninja' 'python')
optdepends=('qt6-declarative: development tools')
conflicts=('android-aarch64-qt6-quickcontrols2')
provides=('android-aarch64-qt6-quickcontrols2')
replaces=('android-aarch64-qt6-quickcontrols2')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(android-${_android_arch}-qt6)
_pkgfqn="qtdeclarative-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Exclude-qmltime-when-cross-compiling.patch')
sha256sums=('4fb4efb894e0b96288543505d69794d684bcfbe4940ce181d3e6817bda54843e'
            'bb7b95defa64b2dc1d41578d92fbd21d4d4f87b104d3d468045560cd1a98d679')

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
    -DQT_NO_PACKAGE_VERSION_CHECK:BOOL=TRUE \
    -DANDROID_SDK_ROOT=${ANDROID_HOME} \
    -DANDROID_NDK_ROOT=${ANDROID_NDK_HOME} \
    -DANDROID_STL="c++_shared" \
    -DFEATURE_pkg_config=ON \
    -DFEATURE_quickcontrols2_quick_designer=OFF \
    -DFEATURE_quickcontrols2_fusion=OFF \
    -DFEATURE_quickcontrols2_imagine=OFF \
    -DFEATURE_quickcontrols2_universal=OFF \
    -DFEATURE_quickcontrols2_fluentwinui3=OFF \
    -DFEATURE_quickcontrols2_macos=OFF \
    -DFEATURE_quickcontrols2_ios=OFF \
    -DFEATURE_quickcontrols2_windows=OFF
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
