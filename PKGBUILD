# Based on AUR PKGBUILDS for phonon-gstreamer-git, phonon-qt6-git
#     and phonon-qt6-mpv-git (all respective contributors apply herein)
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=phonon-qt6-gstreamer-git
pkgver=4.10.0_r3316.g2bfadef4
pkgrel=1
arch=($CARCH)
pkgdesc='Phonon GStreamer backend for Qt6'
url='https://community.kde.org/Phonon'
license=(LGPL)
depends=(gst-plugins-base phonon-qt6)
optdepends=('pulseaudio: PulseAudio support'
            'gst-plugins-good: PulseAudio support and good codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs'
            'gst-libav: libav codec')
makedepends=(extra-cmake-modules phonon-qt6 qt6-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git} phonon-qt6-backend phonon-qt6-backend-git)
source=("git+https://github.com/KDE/phonon-gstreamer.git"
        qt6_build_patch.patch)
sha256sums=('SKIP'
            '3da6e5739f36f829141edc3d4c814389a425d1eecd597f1e7e63708356b8f148')

pkgver() {
  cd phonon-gstreamer
  _ver="$(grep -m1 'project(PhononGStreamer VERSION' CMakeLists.txt | cut -d ' ' -f3 | tr -d ')' | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d phonon-gstreamer -p1 < qt6_build_patch.patch # Fix building on Qt6
}

build() {
  cmake -B build -S phonon-gstreamer \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # phonon-gstreamer-qt5 contains this files
  # User may have it installed for compatibility with Qt5 apps
  # Remove our copy to avoid file conflicts
  rm -r "$pkgdir"/usr/share
}
