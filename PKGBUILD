# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=giada
pkgver=0.13.1
pkgrel=1
pkgdesc="A looper, drum machine, sequencer, live sampler and plugin host"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
depends=('fltk' 'jansson' 'libpulse' 'libxpm' 'rtmidi')
makedepends=('steinberg-vst36')
source=("${pkgname}-${pkgver}-src.tar.gz::http://www.giadamusic.com/download/grab/source"
        "$pkgname.desktop"
        "$pkgname.png")
install="$pkgname.install"
md5sums=('f0f1497429149ff66721118c97e572c2'
         '06238158680470ab01fbbeb33353e58e'
         'f9b6e4233890720af50c536c4b2c92c0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"

  # src/deps/juce/juce_audio_processors/format_types/juce_VST3Headers.h
  msg2 "Fixing VST3 SDK include paths in JUCE sources..."
  for file in \
      src/deps/juce/juce_audio_processors/format_types/juce_VSTPluginFormat.cpp
  do
    sed -i -e 's|pluginterfaces/vst2.x/|vst36/pluginterfaces/vst2.x/|g' "$file"
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"

  # the rtmidi AUR package puts the RtMidi headers in /usr/include/rtmidi
  export CXXFLAGS="$CXXFLAGS -I/usr/include/rtmidi"
  ./configure --prefix=/usr --target=linux --enable-vst
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
