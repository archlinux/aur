# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=4.7.7.48706
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=(apr-util dbus-glib glu gtk2 libgl libidn libjpeg-turbo libpng
         libxml2 mesa nss openal pangox-compat sdl zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'flashplugin: for inworld Flash support'
  'freealut: for OpenAL support'
  'gstreamer0.10: For video support - may need good, bad and ugly plugins'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
install=firestorm.install
if [ "$CARCH" = "i686" ]; then
  source=("http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Release_i686_$pkgver.tar.xz"
          firestorm.install
          firestorm.desktop
          firestorm.launcher)
  sha256sums=(b826d89dd2b98e90f26fd0ec7b63351c30e55d17dda7e68188f1258b725737a3
              ed579cd61cadda55956e5dd8063a34f3c02b8263372e52e9312966a2bf79b55c
              6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1
              b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530)
else
  source=("http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Releasex64_x86_64_$pkgver.tar.xz"
          firestorm.install
          firestorm.desktop
          firestorm.launcher)
  sha256sums=(e90877eba293266701590e4c528ebf8684f751932307b14cf30da578246eae00
              ed579cd61cadda55956e5dd8063a34f3c02b8263372e52e9312966a2bf79b55c
              6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1
              b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530)
fi

prepare() {
  if [ "$CARCH" = "i686" ]; then
    mv "$srcdir/Phoenix_FirestormOS-Release_i686_$pkgver" "$srcdir/firestorm"
  else
    mv "$srcdir/Phoenix_FirestormOS-Releasex64_x86_64_$pkgver" "$srcdir/firestorm"
  fi
}

package() {
  cd "$srcdir"

  # Fix fontconfig >= 2.9.0 issue
  ln -s libfontconfig.so.1.4.4 firestorm/lib/libfontconfig.so.1

  # File modes fix.
  find firestorm -type d -execdir chmod 755 "{}" \;
  find firestorm -type f -execdir chmod 644 "{}" \;
  chmod 755 firestorm/bin/* firestorm/firestorm

  # Install Desktop File
  install -D -m644 "$srcdir"/firestorm.desktop \
          "$pkgdir"/usr/share/applications/firestorm.desktop

  # Install Icon File
  install -D -m644 "$srcdir"/firestorm/firestorm_icon.png \
          "$pkgdir"/usr/share/pixmaps/firestorm_icon.png

  # Install Launcher
  install -D -m755 "$srcdir"/firestorm.launcher \
          "$pkgdir"/usr/bin/firestorm

  # Move Data to Destination Directory
  install -d "$pkgdir"/opt/
  mv firestorm/ "$pkgdir"/opt/

  # Change Permissions of files to root:games
  chown -R root:games "$pkgdir"/opt/firestorm
  chmod -R g+r "$pkgdir"/opt/firestorm

  # Make Binary Group-Executable
  chmod g+x "$pkgdir"/opt/firestorm/firestorm
}
