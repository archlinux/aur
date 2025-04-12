# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kwave-git
pkgver=25.07.70.r4305.c4c63fcd
pkgrel=1
pkgdesc="A sound editor for KDE. (GIT version)"
arch=('x86_64')
url='https://apps.kde.org/kwave'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'qt6-base' # libQt5Concurrent.so libQt5Core.so libQt5DBus.so libQt5Gui.so libQt5Network.so libQt5Widgets.so libQt5Xml.so
  'qt6-multimedia' # libQt5Multimedia.so
  'karchive' # libKF6Archive.so
  'kcompletion' # libKF6Completion.so
  'kconfig' # libKF6ConfigCore.so libKF6ConfigGui.so
  'kconfigwidgets' # libKF6ConfigWidgets.so
  'kcoreaddons' # libKF6CoreAddons.so
  'kcrash' # libKF6Crash.so
  'kdbusaddons' # libKF6DBusAddons.so
  'ki18n' # libKF6I18n.so
  'kiconthemes' # libKF6IconThemes.so
  'kio' # libKF6KIOCore.so libKF6KIOFileWidgets.so libKF6KIOGui.so libKF6KIOWidgets.so
  'ktextwidgets' # libKF6TextWidgets.so
  'kwidgetsaddons' # libKF6WidgetsAddons.so
  'kxmlgui' # libKF6XmlGui.so
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
  'qt6-tools'
  'kdoctools'
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
