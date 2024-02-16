# Maintainer: Mihkel Tõnnov <mihhkel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Patrick Auernig <patrick.auernig@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Darwin Bautista <djclue917@gmail.com>


pkgname=soundkonverter
pkgver=3.0.1.27.gca95836
pkgrel=4
pkgdesc="Front-end to various audio converters"
arch=('i686' 'x86_64')
url="https://store.kde.org/p/1126634"
license=('GPL')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so libm.so
  'kcompletion5' # libKF5Completion.so
  'kconfig5' # libKF5ConfigCore.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'cdparanoia' # libcdda_interface.so libcdda_paranoia.so 
  'kdelibs4support' # libKF5KDELibs4Support.so
  'ki18n5' # libKF5I18n.so
  'kio5' # libKF5KIOCore.so libKF5KIOWidgets.so
  'knotifications5' # libKF5Notifications.so
  'kservice5' # libKF5Service.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'kxmlgui5' # libKF5XmlGui.so
  'solid5' # libKF5Solid.so
  'libkcddb5' # libKF5Cddb.so
  'phonon-qt5' # libphonon4qt5.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Widgets.so libQt5Xml.so 
  'taglib>=1.13.1' # libtag.so
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'kdoctools5'
  'extra-cmake-modules'
  'cmake'
  'kdesignerplugin'
  'kinit'
)
optdepends=(
  'cdrkit: cdda2wav backend'
  'faac: faac backend'
  'faad2: faad backend'
  'ffmpeg: ffmpeg backend'
  'flac: flac backend'
  'fluidsynth: flouidsynth backend'
  'lame: lame backend'
  'mac: mac backend'
  'mplayer: mplayer backend'
  'mp3gain: mp3gain backend'
  'opus-tools: opus backend'
  'speex: speexenc, speexdec backends'
  'timidity++: midi backend'
  'twolame: twolame backend'
  'vorbisgain: vorbisgain backend'
  'vorbis-tools: vorbis tools backend'
  'wavpack: wavpack backend'
  'sox: sox plugin (change sample rate, various effects)'
)
source=(
  'git+https://github.com/dfaust/soundkonverter.git'
  'taglib2.diff'
)
provides=('soundkonverter-git')
conflicts=('soundkonverter-git')
sha256sums=(
  'SKIP'
  '6775198a5c30495ead5cda9756643e7e3c5b767dd5f322f985c9775bb37093e9'
)
# options=('debug')

pkgver() {
  cd "$srcdir/soundkonverter"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "$srcdir/soundkonverter"
  patch -Np1 -i "$srcdir/taglib2.diff"
}

build() {
  cmake -S soundkonverter/src -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
