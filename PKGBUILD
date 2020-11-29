# Maintainer: Alex Tharp <alex@toastercup.io>
# Based on firestorm-bin PKGBUILD by: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-beta-bin
pkgver=6.4.5.60799
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life. This is the beta release that currently features the Environmental Enhancement Project (EEP)."
url="https://www.firestormviewer.org/"
license=('GPL')
arch=('x86_64')
depends=(dbus-glib gconf glu gtk2 lib32-libidn lib32-libsndfile
         lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng
         libxss libxml2 mesa nss openal sdl vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'gstreamer: For video support - may need good, bad and ugly plugins'
  'lib32-gst-plugins-good: for voice support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
conflicts=('firestorm' 'firestorm-bin' 'firestorm-nightly')
install=firestorm.install
source=("https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Betax64_x86_64_$pkgver.tar.xz"
         firestorm.desktop
         firestorm.launcher)
md5sums=('a81c456113de1fd2ba4fb52671dded42'
         '6b22ac512adc9b226fd91a23f7fe9921'
         '2be5ef0f27414638a81003aa2f2ea6f1')

prepare() {
  mv "$srcdir/Phoenix_Firestorm-Betax64_x86_64_$pkgver" "$srcdir/firestorm"

  cd "firestorm"
  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

package() {
  cd "$srcdir/firestorm"

  # File modes fix.
  find -type d -execdir chmod 755 "{}" \;
  find -type f -execdir chmod 644 "{}" \;
  chmod 755 bin/* firestorm etc/*

  # Install Desktop File
  install -D -m644 ../firestorm.desktop \
          "$pkgdir"/usr/share/applications/firestorm.desktop

  # Install Icon File
  install -D -m644 firestorm_icon.png \
          "$pkgdir"/usr/share/pixmaps/firestorm_icon.png

  # Install Launcher
  install -D -m755 ../firestorm.launcher \
          "$pkgdir"/usr/bin/firestorm

  # Move Data to Destination Directory
  cd ..
  install -d "$pkgdir"/opt
  mv firestorm/ "$pkgdir"/opt
}
