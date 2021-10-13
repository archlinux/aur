# Maintainer: redtide <redtid3 at gmail dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Joermungand <joermungand at gmail dot com>

pkgname=loopauditioneer-svn
pkgver=r62
pkgrel=1
pkgdesc="Software for loop and cue handling in .wav files"
arch=('i686' 'x86_64')
url="http://loopauditioneer.sourceforge.net/"
license=('GPL3')
depends=('wxgtk3' 'webkit2gtk' 'rtaudio' 'libsamplerate')
makedepends=('svn')
provides=('loopauditioneer')
conflicts=('loopauditioneer')
source=("${pkgname%-*}"::'svn://svn.code.sf.net/p/loopauditioneer/code/trunk'
        'loopauditioneer-datadir.diff'
        "${pkgname%-*}.desktop")
md5sums=('SKIP'
         '2a48bc667b0f4b01aeb7d9c3c9a7319a'
         '0e2286c155701065663461be6c1056ba')

_cpp_sources=(
  AudioSettingsDialog.cpp
  AutoLoopDialog.cpp
  AutoLooping.cpp
  BatchProcessDialog.cpp
  CrossfadeDialog.cpp
  CueMarkers.cpp
  CutNFadeDialog.cpp
  FFT.cpp
  FileHandling.cpp
  ListInfoDialog.cpp
  LoopAuditioneer.cpp
  LoopMarkers.cpp
  LoopOverlay.cpp
  LoopParametersDialog.cpp
  MyFrame.cpp
  MyListCtrl.cpp
  MyPanel.cpp
  MyResampler.cpp
  MySound.cpp
  PitchDialog.cpp
  StopHarmonicDialog.cpp
  WaveformDrawer.cpp
)

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/${pkgname%-*}"
  patch -p1 -N -r - -i "$srcdir"/loopauditioneer-datadir.diff || true
}

build() {
  cd "$srcdir/${pkgname%-*}"

  echo "Building libsndfile..."
  (
    cd lib-src/libsndfile;
    aclocal;
    automake;
    ./configure \
      --disable-external-libs \
      --enable-static;
    make
  )

  ln -sf libsndfile/src/.libs/libsndfile.a lib-src

  echo "Building LoopAuditioneer..."
  (
    cd src
    g++ \
      -DDATADIR=\"/usr/share/loopauditioneer\" \
      -o LoopAuditioneer \
      ${_cpp_sources[*]} \
      -I../lib-src/libsndfile/src \
      ../lib-src/libsndfile.a \
      `pkg-config --cflags --libs rtaudio` \
      -lm \
      -lpthread \
      -lsamplerate \
      `wx-config-gtk3 --cxxflags --unicode=yes --libs` \
  )
}

package() {
  cd "$srcdir/${pkgname%-*}"
  # binary
  install -Dm755 src/LoopAuditioneer "$pkgdir/usr/bin/${pkgname%-*}"
  # desktop file
  install -Dm644 "${srcdir}/${pkgname%-*}.desktop" -t "$pkgdir/usr/share/applications"
  # icons
  install -Dm644 src/icons/*.png icons/index.url -t "$pkgdir/usr/share/${pkgname%-*}/icons"
  install -Dm755 icons/24x24/* -t "$pkgdir/usr/share/${pkgname%-*}/icons/24x24"
  install -Dm644 src/help/help.zip -t "$pkgdir/usr/share/${pkgname%-*}/help"
  #install -Dm644 src/help/images/* -t "$pkgdir/usr/share/${pkgname%-*}/help/images/"
  # application icon
  install -dm755 "$pkgdir/usr/share/pixmaps"
  ln -sf "../../${pkgname%-*}/icons/LoopyIcon-48.png" "$pkgdir/usr/share/pixmaps/${pkgname%-*}.png"
  # documentation
  install -Dm644 README.txt -t "$pkgdir/usr/share/doc/${pkgname}"
  # icons license
  install -Dm755 icons/readme.txt "$pkgdir/usr/share/licenses/${pkgname}/license-icons.txt"
}

