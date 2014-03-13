# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=4.6.1.40478
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life."
url="http://www.firestormviewer.org/"
license=('GPL')
depends=(
  'openal' 'gnome-vfs' 'gtk2' 'libpng' 'libxml2' 'dbus-glib'
  'libidn' 'sdl' 'mesa' 'apr-util' 'libgl' 'libjpeg-turbo'
  'nss' 'glu' 'pangox-compat'
)
optdepends=(
  'libpulse: for PulseAudio support'
  'alsa-lib: for ALSA support'
  'nvidia-utils: for NVIDIA support'
  'flashplugin: for inworld Flash support'
  'gstreamer0.10: For video support - may need good, bad and ugly plugins'
  'freealut: for OpenAL support'
)
arch=('i686' 'x86_64')
install=firestorm.install
options=(!strip)
if [ "$CARCH" = "i686" ]; then
  source=(
    "http://downloads.firestormviewer.org/linux/Phoenix_Firestorm-Release_${CARCH}_$pkgver.tar.bz2"
    "firestorm.instasll"
    "firestorm.desktop"
    "firestorm.launcher"
  )
  sha256sums=(
    'ea91ef1b8d8f9f9f095b45d947c881a04593a4961aa43db9e4b38ffccc316b34'
    'cd919be5e2d28ff86e9b51ffe1076ba8c13acf9c0953fc2f4bb78fe7e79cdbb3'
    '6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1'
    'b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530'
  )
elif [ "$CARCH" = "x86_64" ]; then
  source=(
    "http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Beta_${CARCH}_$pkgver.tar.bz2"
    'firestorm.install'
    'firestorm.desktop'
    'firestorm.launcher'
  )
  sha256sums=(
    'bdd60d6fc27dbb70b95efdb0809e1afa0545759aa5e149bb40fd4102becc9e0b'
    'cd919be5e2d28ff86e9b51ffe1076ba8c13acf9c0953fc2f4bb78fe7e79cdbb3'
    '6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1'
    'b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530'
  )
fi

package() {
    cd "$srcdir"

    # Rename Data Directory
    if [ "$CARCH" = "i686" ]; then
      mv Phoenix_Firestorm-Release_${CARCH}_$pkgver firestorm
    elif [ "$CARCH" = "x86_64" ]; then
      mv Phoenix_FirestormOS-Beta_${CARCH}_$pkgver firestorm
    fi

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
