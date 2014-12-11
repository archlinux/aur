# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=4.6.9.42969
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
license=('GPL')
arch=('i686' 'x86_64')
if [ "$CARCH" = "i686" ]; then
    depends=(
      'openal' 'gtk2' 'libpng' 'libxml2' 'dbus-glib' 'gcc-libs'
      'libidn' 'sdl' 'mesa' 'apr-util' 'libgl' 'libjpeg-turbo'
      'nss' 'glu' 'pangox-compat' 'util-linux' 'zlib')
    optdepends=(
      'libpulse: for PulseAudio support'
      'alsa-lib: for ALSA support'
      'nvidia-utils: for NVIDIA support'
      'flashplugin: for inworld Flash support'
      'gstreamer0.10: For video support - may need good, bad and ugly plugins'
      'freealut: for OpenAL support')
elif [ "$CARCH" = "x86_64" ]; then
    depends=(
      'lib32-openal' 'lib32-gtk2' 'lib32-libpng'
      'lib32-libxml2' 'lib32-dbus-glib' 'lib32-gcc-libs'
      'lib32-libidn' 'lib32-sdl' 'lib32-mesa' 'apr-util' 'lib32-libgl'
      'lib32-libjpeg-turbo' 'lib32-nss' 'lib32-glu' 'lib32-pangox-compat'
      'lib32-util-linux' 'lib32-zlib')
    optdepends=(
      'lib32-libpulse: for PulseAudio support'
      'lib32-alsa-lib: for ALSA support'
      'lib32-nvidia-utils: for NVIDIA support'
      'lib32-flashplugin: for inworld Flash support'
      'lib32-gstreamer0.10: For video support - may need good, bad and ugly plugins'
      'lib32-freealut: for OpenAL support')
fi
install=firestorm.install
options=(!strip)
source=("http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Release_i686_$pkgver.tar.bz2"
        "firestorm.install"
        "firestorm.desktop"
        "firestorm.launcher")
sha256sums=('ee412bc50f0ee8d0f519fa4ad1578f24b9fa8fd7cc9270a1830b8e2665d4bbb4'
            'cd919be5e2d28ff86e9b51ffe1076ba8c13acf9c0953fc2f4bb78fe7e79cdbb3'
            '6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1'
            'b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530')

package() {
  cd "$srcdir"

  # Rename Data Directory
  mv Phoenix_FirestormOS-Release_i686_$pkgver firestorm

  # Fix fontconfig >= 2.9.0 issue
  ln -si libfontconfig.so.1.4.4 firestorm/lib/libfontconfig.so.1

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
