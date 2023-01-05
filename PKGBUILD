# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: funkyou <spamopfer@nickname.berlin.de>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mlt6
pkgver=6.26.1
pkgrel=11
pkgdesc="An open source multimedia framework"
arch=(x86_64)
url="https://www.mltframework.org"
license=(GPL)
depends=(libebur128)
optdepends=('sdl_image: SDL1 plugin'
            'sdl2: SDL2 plugin'
            'libsamplerate: libavresample plugin'
            'sox: SOX (Audio Swiss Army Knife) plugin'
            'ffmpeg: ffmpeg plugin'
            'vid.stab: video stabilize plugin'
            'qt5-svg: Qt5 plugins'
            'jack: JACK sound output plugin'
            'ladspa: LADSPA plugins'
            'libexif: auto rotate plugin'
            'frei0r-plugins: for additional effects'
            'movit: opengl plugin'
            'opencv: openCV plugin'
            'rubberband: audio pitch plugin'
            'gdk-pixbuf2: gdk plugin'
            'pango: gdk plugin'
            'rtaudio: rtaudio plugin'
            'python: python bindings')
makedepends=(cmake ladspa frei0r-plugins libdv sdl_image libsamplerate sox ffmpeg vid.stab qt5-svg
             jack libexif python swig movit eigen opencv rubberband gdk-pixbuf2 pango rtaudio imagemagick)
conflicts=(python-mlt)
provides=(python-mlt)
replaces=(python-mlt)
source=($pkgname-$pkgver.tar.gz::https://github.com/mltframework/mlt/archive/v$pkgver.tar.gz
        https://github.com/mltframework/mlt/commit/7063e88e.patch
        https://github.com/mltframework/mlt/commit/a87229bc.patch
        ffmpeg5.patch)
sha256sums=('8a484bbbf51f33e25312757531f3ad2ce20607149d20fcfcb40a3c1e60b20b4e'
            '8c2f537e46089ac165da12988aecf49e24d20ec33c1b88c6301f3d2640b8d8f3'
            'fc08a5cefb9e164966d5a6514196866dc96bb33719b5b7c069e0b8910e8f8fa5'
            '7e21d494dbd5d5fe4627b82fbbfe63b52cbda316ad24ed995f8cbe60019566a0')

prepare() {
# Backport fixes for kdenlive crashes
  patch -d mlt-$pkgver -p1 < 7063e88e.patch
  patch -d mlt-$pkgver -p1 < a87229bc.patch
# Fix build with FFmpeg 5
  patch -d mlt-$pkgver -p1 < ffmpeg5.patch
}

build() {
  cmake -B build -S mlt-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMOD_OPENCV=ON \
    -DMOD_GTK2=OFF \
    -DSWIG_PYTHON=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  mv "$pkgdir"/usr/bin/melt{,6} # Fix conflicts with mlt 7

# Compress lumas
  for pgm in "$pkgdir"/usr/share/mlt/lumas/*/*.pgm; do
    convert $pgm{,.png}
    rm -f $pgm
  done
}
