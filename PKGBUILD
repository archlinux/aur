# Merged with official ABS kid3 PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgbase=kid3-git
pkgname=(kid3-common-git kid3-qt-git kid3-git)
pkgver=3.8.7_r2449.g3e43e417
pkgrel=1
pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor"
arch=($CARCH)
url="https://kid3.kde.org/"
license=('GPL')
depends=(chromaprint flac id3lib kxmlgui-git libmp4v2 qt5-declarative qt5-multimedia taglib kio-git)
makedepends=(git cmake docbook-xsl extra-cmake-modules-git kdoctools-git python qt5-tools)
source=("git+https://github.com/KDE/${pkgbase%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  _major_ver="$(grep -m1 'set(CPACK_PACKAGE_VERSION_MAJOR' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')')"
  _minor_ver="$(grep -m1 'set(CPACK_PACKAGE_VERSION_MINOR' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')')"
  _patch_ver="$(grep -m1 'set(CPACK_PACKAGE_VERSION_PATCH' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')')"
  echo "${_major_ver}.${_minor_ver}.${_patch_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  export CXXFLAGS+=' -DNDEBUG' # FS#69904
  cmake -B build -S ${pkgbase%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_APPS="CLI;Qt;KDE" \
    -DWITH_MP4V2=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=ON
  cmake --build build
}

package_kid3-common-git() {
  pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor, CLI version and common files"
  depends=(chromaprint flac id3lib libmp4v2 libvorbis qt5-base taglib)
  optdepends=('qt5-declarative: GUI support library'
              'qt5-multimedia: GUI support library')

  DESTDIR="$pkgdir" cmake --install build

  rm -r "$pkgdir"/usr/bin/kid3{,-qt} \
        "$pkgdir"/usr/share/{applications,icons,kxmlgui5,metainfo}
}

package_kid3-qt-git() {
  pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor, Qt version"
  depends=("kid3-common=$pkgver" qt5-declarative qt5-multimedia)

  DESTDIR="$pkgdir" cmake --install build/src/app/qt
}

package_kid3-git() {
  pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor, KDE version"
  depends=("kid3-common=$pkgver" kxmlgui-git qt5-declarative qt5-multimedia kio-git)

   DESTDIR="$pkgdir" cmake --install build/src/app

  rm -r "$pkgdir"/usr/bin/kid3-{cli,qt} \
        "$pkgdir"/usr/share/applications/org.kde.kid3-qt.desktop \
        "$pkgdir"/usr/share/icons/hicolor/*/apps/kid3-qt.{png,svg} \
        "$pkgdir"/usr/share/metainfo/org.kde.kid3-qt.appdata.xml
}
