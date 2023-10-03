# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=k3b-git
pkgver=23.11.70.r7074.4f649e0a5
pkgrel=1
pkgdesc="Feature-rich and easy to handle CD burning application. (Git version)"
arch=('x86_64')
license=('GPL')
url='https://kde.org/applications/en/multimedia/org.kde.k3b'
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libm.so
  'qt5-base' # libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Network.so libQt5Widgets.so libQt5Xml.so
  'qt5-webengine' # libQt5Xml.so
  'karchive5' # libKF5Archive.so
  'kauth5' # libKF5AuthCore.so
  'kbookmarks5' # libKF5Bookmarks.so
  'kcompletion5' # libKF5Completion.so
  'kconfig5' # ibKF5ConfigCore.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kxmlgui5' # libKF5XmlGui.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kiconthemes5' # libKF5IconThemes.so
  'kio5' # libKF5KIOCore.so libKF5KIOFileWidgets.so libKF5KIOGui.so libKF5KIOWidgets.so
  'kjobwidgets5' # libKF5JobWidgets.so
  'knewstuff5' # 'libKF5NewStuffWidgets.so
  'knotifications5' # libKF5Notifications.so
  'kfilemetadata5' # libKF5FileMetaData.so
  'ki18n5' # libKF5I18n.so
  'knotifyconfig5' # libKF5NotifyConfig.so
  'kcmutils5' # libKF5KCMUtils.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'libkcddb' # libKF5Cddb.so
  'solid' # libKF5Solid.so
  'taglib' # libtag.so
  'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
  'flac' 'libFLAC++.so'
  'lame' 'libmp3lame.so'
  'libdvdread' 'libdvdread.so'
  'libmpcdec' 'libmpcdec.so'
  'libogg' 'libogg.so'
  'libsamplerate' 'libsamplerate.so'
  'libsndfile' 'libsndfile.so'
  'libvorbis' 'libvorbis.so' 'libvorbisenc.so' 'libvorbisfile.so'
  'libmad' # libmad.so
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'cmake'
  'extra-cmake-modules'
  'kdoctools'
  'python'
)
optdepends=(
  'cdrdao: for CD DAO mode burning support'
  'libburn: for CD, DVD & BluRay burning support'
  'dvd+rw-tools: for CD, DVD & BluRay burning support'
  'normalize: for WAV normalization'
  'vcdimager: for VCD burning support'
  'transcode: for advanced MPEG conversion support'
  'sox: for encode audio files in formats such as AIFF or VOC'
  'emovix: for bootable multimedia CD/DVD support'
)
provides=(
  'k3b'
  'libk3bdevice.so'
  'libk3blib.so'
)
conflicts=('k3b')
source=('git+https://invent.kde.org/multimedia/k3b.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd k3b
  _ver="$(cat CMakeLists.txt | grep -m3 -e RELEASE_SERVICE_VERSION_MAJOR -e RELEASE_SERVICE_VERSION_MINOR -e RELEASE_SERVICE_VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e 's|Sndfile|SndFile|g' \
      -i k3b/cmake/modules/FindSndfile.cmake \
      -i k3b/CMakeLists.txt

  sed 's|MUSE |Muse |g' -i k3b/cmake/modules/FindMuse.cmake
}

build() {
  cmake -S k3b -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=/usr/lib/k3b \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
