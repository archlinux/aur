# Contributor: Jan Cholasta <grubber at grubber cz>
# Maintainer: Jan Cholasta <grubber at grubber cz>

pkgname=slade
pkgver=3.0.2
pkgrel=3
pkgdesc="SLADE3 Doom editor."
arch=('i686' 'x86_64')
url="http://slade.mancubus.net/"
license=('GPL')
depends=('fluidsynth' 'freeimage' 'sfml1.6' 'wxgtk2.9')
makedepends=('cmake' 'imagemagick')
source=(http://slade.mancubus.net/files/${pkgname}_302_src.zip
        build.patch)
md5sums=('4cce3c83292ea55044b7d385bb61a907'
         '09d9a15776a96af7b1b84512bc651033')

prepare() {
  patch -p1 <"$srcdir/build.patch"
}

build() {
  cmake -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.9 \
        -DwxWidgets_wxrc_EXECUTABLE=/usr/bin/wxrc-2.9 \
        -DCMAKE_INCLUDE_PATH=/usr/include/sfml-1.6 \
        -DSFML_SYSTEM_LIBRARY_SHARED_NONDEBUG=/usr/lib/libsfml-system-1.6.so \
        -DSFML_AUDIO_LIBRARY_SHARED_NONDEBUG=/usr/lib/libsfml-audio-1.6.so \
        -DCMAKE_CXX_FLAGS="-I/usr/include/sfml-1.6 -DNDEBUG" \
        .
  make

  convert "slade.ico[0]" slade.png
}

package() {
  install -Dm755 slade "$pkgdir/usr/bin/slade"
  install -Dm644 dist/slade.pk3 "$pkgdir/usr/share/slade3/slade.pk3"

  install -Dm644 slade.png "$pkgdir/usr/share/pixmaps/slade.png"
  install -Dm644 slade.desktop "$pkgdir/usr/share/applications/slade.desktop"
}
