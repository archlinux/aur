# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kwave-git
pkgver=23.11.70.r3926.64746e68
pkgrel=1
pkgdesc="A sound editor for KDE. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/multimedia/org.kde.kwave'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'qt5-base' # libQt5Concurrent.so libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Network.so libQt5Widgets.so libQt5Xml.so 
  'qt5-multimedia' # libQt5Multimedia.so
  'solid5' # libKF5Solid.so
  'sonnet5' # libKF5SonnetUi.so
  'karchive5' # libKF5Archive.so
  'kauth5' # libKF5Auth.so libKF5AuthCore.so
  'kbookmarks5' # libKF5Bookmarks.so
  'kcodecs5' # libKF5Codecs.so
  'kcompletion5' # libKF5Completion.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kcrash5' # libKF5Crash.so
  'kdbusaddons5' # libKF5DBusAddons.so
  'ki18n5' # libKF5I18n.so
  'kiconthemes5' # libKF5IconThemes.so
  'kio5' # libKF5KIOCore.so libKF5KIOFileWidgets.so libKF5KIOGui.so libKF5KIOWidgets.so
  'kitemviews5' # libKF5ItemViews.so
  'kjobwidgets5' # libKF5JobWidgets.so
  'kservice5' # libKF5Service.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'kwindowsystem5' # libKF5WindowSystem.so
  'kxmlgui5' # libKF5XmlGui.so
  'libx11' # libX11.so
  'alsa-lib' 'libasound.so'
  'audiofile' 'libaudiofile.so'
  'libsamplerate' 'libsamplerate.so'
  'libpulse' 'libpulse.so'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'cmake'
  'extra-cmake-modules'
  'kdoctools5'
  'doxygen'
  'python'
  'librsvg'
  'opus'
  'libogg'
  'libvorbis'
  'fftw'
  'id3lib'
  'libmad'
  'flac'
)
optdepends=(
  'libmad: MP3 plugin'
  'zlib: MP3 plugin'
  'id3lib: MP3 ID3 tag plugin'
  'opus: OGG plugin'
  'libogg: OGG plugin'
  'libvorbis: OGG plugin'
  'fftw: Sonagram plugin'
  'flac: FLAC plugin'
)
conflicts=('kwave')
provides=(
  'kwave'
  'libkwave.so'
  'libkwavegui.so'
)
source=('git+https://invent.kde.org/multimedia/kwave.git')
sha256sums=('SKIP')

pkgver() {
  cd kwave
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake -S kwave -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON \
    -DWITH_MP3=ON \
    -DWITH_FLAC=ON \
    -DWITH_OGG_OPUS=ON \
    -DWITH_OGG_VORBIS=ON \
    -DWITH_PULSEAUDIO=ON \
    -DWITH_ALSA=ON \
    -DWITH_QT_AUDIO=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
