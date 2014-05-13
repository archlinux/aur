# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=4.6.5.40833
pkgrel=2
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
    "http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Release_${CARCH}_$pkgver.tar.bz2"
    "firestorm.install"
    "firestorm.desktop"
    "firestorm.launcher"
  )
  sha256sums=(
    '5db53e07678488e0100314256d5199f812a660e87ec1912f6e6758851f997494'
    'cd919be5e2d28ff86e9b51ffe1076ba8c13acf9c0953fc2f4bb78fe7e79cdbb3'
    '6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1'
    'b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530'
  )
elif [ "$CARCH" = "x86_64" ]; then
  depends=("${depends[@]}" 'lib32-libidn')
  source=(
    "http://downloads.firestormviewer.org/linux/Phoenix_FirestormOS-Betax64_${CARCH}_$pkgver.tar.bz2"
    'firestorm.install'
    'firestorm.desktop'
    'firestorm.launcher'
  )
  sha256sums=(
    '595bc26807542f83b03de1b9dfe5cce503e3fdcf1edf9b38a13d0f70b3772635'
    'cd919be5e2d28ff86e9b51ffe1076ba8c13acf9c0953fc2f4bb78fe7e79cdbb3'
    '6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1'
    'b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530'
  )
fi

package() {
    cd "$srcdir"

    # Rename Data Directory
    if [ "$CARCH" = "i686" ]; then
      mv Phoenix_FirestormOS-Release_${CARCH}_$pkgver firestorm
    elif [ "$CARCH" = "x86_64" ]; then
      mv Phoenix_FirestormOS-Betax64_${CARCH}_$pkgver firestorm
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
