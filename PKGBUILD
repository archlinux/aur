# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kaudiocreator-git
pkgver=1.3.r886.f21c160
pkgrel=3
pkgdesc="A program for ripping and encoding Audio-CDs, encoding files from disk. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/unmaintained/org.kde.kaudiocreator'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so
  'glibc' # libstdc++.so libc.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Network.so libQt5Widgets.so
  'bash'
  'taglib1' # libtag.so
  'libmusicbrainz5' 'libmusicbrainz5.so'
  'libdiscid' # libdiscid.so
  'kcodecs5' # libKF5Codecs.so
  'kcompletion5' # libKF5Completion.so
  'knotifyconfig5' # libKF5NotifyConfig.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kcmutils5' # libKF5KCMUtils.so
  'phonon-qt5' # libphonon4qt5.so
  'kxmlgui5' # libKF5XmlGui.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kio5' # libKF5KIOCore.so libKF5KIOWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'knotifications5' # libKF5Notifications.so
  'ki18n5' # libKF5I18n.so
  'solid5' # libKF5Solid.so
  'kservice5' # libKF5Service.so
  'kdelibs4support' # libKF5KDELibs4Support.so
  'cdparanoia'
  'alsa-lib' 'libasound.so'
  'flac' 'libFLAC.so'
  'libogg' 'libogg.so'
  'libvorbis' 'libvorbis.so' 'libvorbisenc.so'
  'hicolor-icon-theme'
  'audiocd-kio'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'kdoctools5'
  'kdesignerplugin'
  'kinit5'
  'doxygen'
  'python'
)
conflicts=('kaudiocreator')
provides=('kaudiocreator')
source=(
  'git+https://invent.kde.org/unmaintained/kaudiocreator.git'
  'git+https://invent.kde.org/multimedia/libkcddb.git#branch=release/20.04'
  'git+https://invent.kde.org/multimedia/libkcompactdisc.git#branch=release/20.04'
  'git+https://invent.kde.org/multimedia/audiocd-kio.git#branch=release/20.04'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd kaudiocreator
  _ver="$(cat main.cpp | grep -m1 KAudioCreator | cut -d '"' -f6)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e 's|SHARED|STATIC|g' \
      -e 's|PRIVATE musicbrainz|&5|g' \
      -i libkcddb/libkcddb/CMakeLists.txt

  sed -e 's|SHARED|STATIC|g' \
      -i libkcompactdisc/src/CMakeLists.txt

  sed -e 's|TAGLIB_INCLUDE_DIR|Taglib_INCLUDE_DIRS|g' \
      -e 's|TAGLIB|Taglib|g' \
      -e 's|ServiceMenus|servicemenus|g' \
      -i kaudiocreator/CMakeLists.txt

  # ugly as fuck, but this can do the library coinstalable. share bits is shared with audiocd-kio for kf6,so add audiocd-kio as depends
  # when this PR gets merged, then i do edit to remove this https://invent.kde.org/multimedia/audiocd-kio/-/merge_requests/13/diffs
  sed 's|SOVERSION 5|SOVERSION 55|g' \
      -i audiocd-kio/CMakeLists.txt
}

build() {
  cmake -S libkcddb -B build-libkcddb \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/fakeroot/usr" \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build-libkcddb
  cmake --install build-libkcddb

  cmake -S libkcompactdisc -B build-libkcompactdisc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/fakeroot/usr" \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build-libkcompactdisc
  cmake --install build-libkcompactdisc

  # ugly fix for find Cdinfo in the wanted path
  sed "s|<KCddb/Cdinfo>|\"${srcdir}/fakeroot/usr/include/KF5/KCddb/Cdinfo\"|g" -i audiocd-kio/plugins/audiocdencoder.h
  cmake -S audiocd-kio -B build-audiocd-kio \
    -DCMAKE_BUILD_TYPE=Release \
    -DKF5Cddb_DIR="${srcdir}/fakeroot/usr/lib/cmake/KF5Cddb" \
    -DKF5CompactDisc_DIR="${srcdir}/fakeroot/usr/lib/cmake/KF5CompactDisc" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build-audiocd-kio

  export PKG_CONFIG_PATH=/usr/lib/taglib1/pkgconfig
  cmake -S kaudiocreator -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON \
    -DKF5Cddb_DIR="${srcdir}/fakeroot/usr/lib/cmake/KF5Cddb" \
    -DKF5CompactDisc_DIR="${srcdir}/fakeroot/usr/lib/cmake/KF5CompactDisc" \
    -DSERVICES_INSTALL_DIR=/usr/share/kio \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  DESTDIR="${pkgdir}" cmake --install build-audiocd-kio
  # Remove colided files with audiocd-kio
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/libaudiocdplugins.so"
  rm -fr "${pkgdir}/usr/share/config.kcfg"
  rm -fr "${pkgdir}/usr/share/doc/HTML/en/kcontrol"
  rm -fr "${pkgdir}/usr/share/doc/HTML/en/kioslave5"
  rm -fr "${pkgdir}//usr/share/konqsidebartng"
  rm -fr "${pkgdir}/usr/share/metainfo"
  rm -fr "${pkgdir}/usr/share/solid"
}
