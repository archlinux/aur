# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_android_arch=aarch64
pkgname=android-$_android_arch-qt6-multimedia
_qtver=6.9.1
pkgver=${_qtver/-/}
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Classes for audio, video, radio and camera functionality (android)'
depends=('android-aarch64-qt6-base')
optdepends=('android-aarch64-qt6-declarative: QML bindings')
makedepends=('android-cmake' 'android-aarch64-qt6-declarative' 'android-aarch64-qt6-shadertools' 'qt6-declarative' 'qt6-shadertools' 'ninja')
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
groups=(android-${_android_arch}-qt6)
_pkgfqn="qtmultimedia-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        '0001-Fix-compile-flags-of-resonance-audio-for-mingw-w64.patch'
        '0002-Fix-casing-when-including-wininet.h.patch')
sha256sums=('955e36459518ee55f8e2bb79defc6e44aa94dc1edf5ac58a22d7734b2e07391d'
            'f974e0a54693cda47d07964c44130e66e8c4e6207e5e3be4fd3fb8b2d12a05fa'
            '273c69ad51282eb63a2e427239ad771a55d4469cfb2272d853b3308c94a676f2')

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
