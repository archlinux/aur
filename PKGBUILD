# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=k3b-git
pkgver=24.04.70.r7146.0e1739a97
pkgrel=1
pkgdesc="Feature-rich and easy to handle CD burning application. (Git version)"
arch=('x86_64')
license=('GPL')
url='https://apps.kde.org/k3b'
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libm.so
  'qt6-base' # libQt6Core.so libQt6DBus.so libQt6Gui.so libQt6Network.so libQt6Widgets.so libQt6Xml.so
  'qt6-5compat' # libQt6Core5Compat.so
  'qt6-webengine' # libQt5Xml.so
  'karchive' # libKF6Archive.so
  'kauth' # libKF6AuthCore.so
  'kbookmarks' # libKF6Bookmarks.so
  'kcompletion' # libKF6Completion.so
  'kconfig' # ibKF6ConfigCore.so
  'kconfigwidgets' # libKF6ConfigWidgets.so
  'kxmlgui' # libKF6XmlGui.so
  'kcoreaddons' # libKF6CoreAddons.so
  'kiconthemes' # libKF6IconThemes.so
  'kio' # libKF6KIOCore.so libKF6KIOFileWidgets.so libKF6KIOGui.so libKF6KIOWidgets.so
  'kcolorscheme' # libKF6ColorScheme.so
#   'kjobwidgets' # libKF6JobWidgets.so
  'knewstuff' # 'libKF6NewStuffWidgets.so
  'knotifications' # libKF6Notifications.so
  'kfilemetadata' # libKF6FileMetaData.so
  'ki18n' # libKF6I18n.so
  'knotifyconfig' # libKF6NotifyConfig.so
  'kcmutils' # libKF6KCMUtils.so
  'kwidgetsaddons' # libKF6WidgetsAddons.so
  'libkcddb' # libKF6Cddb.so
  'solid' # libKF6Solid.so
  'taglib' # libtag.so
  'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
  'flac' 'libFLAC++.so'
  'lame' 'libmp3lame.so'
  'libdvdread' # libdvdread.so
  'libmpcdec' # libmpcdec.so
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
  'qt6-tools'
  'python'
)
checkdepends=('appstream')
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

  # Silence cmake warning
  sed 's|MUSE |Muse |g' -i k3b/cmake/modules/FindMuse.cmake
}

build() {
  cmake -S k3b -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=/usr/lib/k3b \
    -DK3B_BUILD_API_DOCS=ON \
    -DBUILD_WITH_QT6=ON \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
