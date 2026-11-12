# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=kdeglance
pkgver=2.0.4
pkgrel=1
pkgdesc="Quick Look-style file preview for KDE Plasma and Dolphin"
arch=('x86_64')
url="https://github.com/AlexGraveler/KDEGlance"
license=('GPL-3.0-or-later')
# The same list as upstream's packaging/arch/PKGBUILD, checked by pkg.sh,
# minus qt6-wayland (in qt6-base since Qt 6.12) and ffmpeg (nothing links it,
# qt6-multimedia-ffmpeg pulls it in).
depends=('dolphin' 'glibc' 'hicolor-icon-theme' 'kcoreaddons' 'kimageformats'
         'kio' 'kio-fuse' 'kjobwidgets' 'kservice' 'kwindowsystem' 'libgcc'
         'libraw' 'libstdc++' 'poppler-qt6' 'procps-ng' 'qt6-5compat' 'qt6-base'
         'qt6-imageformats' 'qt6-multimedia' 'qt6-multimedia-ffmpeg' 'qt6-svg')
makedepends=('cmake' 'ninja' 'pkgconf')
optdepends=('libreoffice: Office document previews'
            'kio-extras: SMB and more network protocols'
            'libheif: HEIF/HEIC photos'
            'libavif: AVIF images'
            'libjxl: JPEG XL images'
            'openexr: OpenEXR images'
            'openjpeg2: JPEG 2000 images'
            'fluidsynth: MIDI playback'
            'soundfont-fluid: General MIDI SoundFont for fluidsynth')
install=kdeglance.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d58313505af5692c4917b023675f84eaf22daec6222d8c7803647fb1e65d66f5')

build() {
  # The tests need LibreOffice, ImageMagick, qpdf and Node.js, so they are
  # left out.
  cmake -B build -S "KDEGlance-${pkgver}" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDEGLANCE_QT_PLUGIN_DIR=lib/qt6/plugins \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  # the viewer, both Dolphin plugins, the D-Bus and systemd user services
  # and the license
  DESTDIR="$pkgdir" cmake --install build
}
