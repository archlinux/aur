# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=6.2.4.57588
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
source=("https://downloads.firestormviewer.org/linux/Phoenix_Firestorm-releasex64_x86_64_$pkgver.tar.xz"
        0001-firestorm-libgl-path.patch
        firestorm.desktop
        firestorm.launcher)
sha512sums=('8643868a5343d23f2a18a4dda66c674c8aca9b9704950911b4290ed80ff70f8f839f037d3b22e2aa6b335bebdd94153bdc78f4d7dee17847b3354be9e86f7350'
            '760dc097786275f4d60f9562e22d16b20151c4918cea89508bbe0b649d62b5158326d97086958acd1948c0cbb2f6693d2ac75224487b98729098b99936d0c57a'
            'aaebbd7376e98ce267b99d1b86efb75c5515047ba127e42810b4560361841ee9e00eb20b7939371f6f0076642f51cec7e3d3881cfb9fd8de55e0888c9059c41d'
            'c84fc42b0e3edded09a57a8c9a38d64ee57bc60e72fa7d1fc98f0dd292f0428314f53907010da666f123067f951584ae8d36e1cbfaf31fff3aae02b2ed79fdf6')

prepare() {
  mv "$srcdir/Phoenix_Firestorm-releasex64_x86_64_$pkgver" "$srcdir/firestorm"

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
