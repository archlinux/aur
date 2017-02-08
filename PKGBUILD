# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=5.0.1.52150
pkgrel=2
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=(apr-util dbus-glib glu gtk2 libgl libidn libjpeg-turbo libpng
         libxml2 mesa nss openal pangox-compat sdl zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'gstreamer: For video support - may need good, bad and ugly plugins'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
install=firestorm.install
source=(0001-firestorm-libgl-path.patch
        firestorm.desktop
        firestorm.launcher)
source_i686=("http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Release_i686_$pkgver.tar.xz")
source_x86_64=("http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Releasex64_x86_64_$pkgver.tar.xz")
sha256sums=('619153f3540ad48ec31c702086883a6adccacc70b384b300edaa6f7957f27232'
            '6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1'
            'b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530')
sha256sums_i686=('e46a6db668afe8d22c42410a3a237dc23675d5a8da29e0b2636e3f75ee71bb6d')
sha256sums_x86_64=('29af02ba017f99eb5a7eca51b580e21e692a9d5da5d22e554dac10141fb24797')

prepare() {
  if [ "$CARCH" = "i686" ]; then
    mv "$srcdir/Phoenix_FirestormOS-Release_i686_$pkgver" "$srcdir/firestorm"
  else
    mv "$srcdir/Phoenix_FirestormOS-Releasex64_x86_64_$pkgver" "$srcdir/firestorm"
  fi

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
  chmod 755 bin/* firestorm

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
