# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=6.3.9.58205
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
b2sums=('2d6335aebf408251820794e238eb80af91d786c50b679dff2aa886b0e5f48ef58e8560eb5c673feb7f6faf02480557c2457d4ec4fa7cea611e79dee43dac5b19'
        '1d2745212b45d48af416bbc1ffb66eefac40c5bdd27a3a12e2c2583b5908dc207cc5c2c7f6cd955574cf1fba2ac01c7f7b539507dea2dc6c75ab4b6c209cdcb1'
        '1d323c1a38218bab12dc4129ad541f2514dc64fe6c3cdaa266012a761de34ee96209fe1e9dd17988a814371677ef67354d51630acfca9ce30e3eeb4adf77968e')

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
