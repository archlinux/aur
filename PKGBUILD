# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=giada
pkgver=0.13.0
pkgrel=1
pkgdesc="A looper, drum machine, sequencer, live sampler and plugin host"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
depends=('fltk' 'jansson' 'libpulse' 'libxpm' 'rtmidi')
makedepends=('steinberg-vst36')
source=("${pkgname}-${pkgver}-src.tar.gz::http://www.giadamusic.com/download/grab/source"
        'giada-rtmidi-header.patch'
        'giada-vst-no-werror.patch'
        "$pkgname.desktop"
        "$pkgname.png")
install="$pkgname.install"
md5sums=('52d83bc0972e5696d6b8dbdf6c7bce0c'
         '82d7d245c8048f124324be51ab806b36'
         'a7fbba39f6fba5ff04c6048faa074571'
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

  # fix compiler flags in Makefile.am
  patch -p1 -r - -i "$srcdir/giada-vst-no-werror.patch"

  # fix rtmidi header include path in configure.ac and sources
  if [ -e /usr/include/rtmidi/RtMidi.h ]; then
    patch -p1 -r - -i "$srcdir/giada-rtmidi-header.patch"
    autoconf
  fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"

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
