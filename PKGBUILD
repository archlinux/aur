# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=6.3.2.58052
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
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
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
install=firestorm.install
source=("https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Releasex64_x86_64_$pkgver.tar.xz"
        firestorm.desktop
        firestorm.launcher)
sha512sums=('c87acf9974d12c8d2f63825256313f34d3ba9f78a5e44b03294ee0385f1e3762bee3123006cf302b9e93f604bd73839971785133e502672c25b8249044f3c96a'
            'aaebbd7376e98ce267b99d1b86efb75c5515047ba127e42810b4560361841ee9e00eb20b7939371f6f0076642f51cec7e3d3881cfb9fd8de55e0888c9059c41d'
            'c84fc42b0e3edded09a57a8c9a38d64ee57bc60e72fa7d1fc98f0dd292f0428314f53907010da666f123067f951584ae8d36e1cbfaf31fff3aae02b2ed79fdf6')

prepare() {
  mv "$srcdir/Phoenix_Firestorm-Releasex64_x86_64_$pkgver" "$srcdir/firestorm"

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
