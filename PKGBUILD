# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=giada-git
pkgver=0.26.0.r0.g40540356
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=('x86_64')
url="https://www.giadamusic.com/"
license=('GPL3')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'libx11' 'libxpm')
# upstream vendors a hacked rtaudio :(
makedepends=('alsa-lib' 'catch2' 'cmake' 'fltk' 'gendesk' 'git' 'imagemagick' 'jack'
'libpulse' 'libsamplerate' 'libsndfile' 'libxrandr' 'nlohmann-json' 'rtmidi' 'vst3sdk' 'steinberg-vst')
checkdepends=('xorg-server-xvfb')
provides=('vst3-host')
conflicts=('giada' 'giada-vst')

source=("giada-git::git+https://github.com/monocasual/giada.git"
	"git+https://github.com/steinbergmedia/vst3sdk.git"
	"git+https://github.com/juce-framework/JUCE.git#tag=7.0.5"
      	"git+https://github.com/monocasual/rtaudio.git"
      	"git+https://github.com/monocasual/geompp.git"
      	"git+https://github.com/monocasual/mcl-atomic-swapper.git"
      	"git+https://github.com/monocasual/mcl-audio-buffer.git"
	"git+https://github.com/fltk/fltk.git"
	"git+https://github.com/cameron314/concurrentqueue.git"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  git submodule init
  git config submodule.src/deps/juce.url "$srcdir/JUCE"
  git config submodule.src/deps/mcl-audio-buffer.url "$srcdir/mcl-audio-buffer"
  git config submodule.src/deps/mcl-atomic-swapper.url "$srcdir/mcl-atomic-swapper"
  git config submodule.src/deps/rtaudio.url "$srcdir/rtaudio"
  git config submodule.src/deps/vst3sdk.url "$srcdir/vst3sdk"
  git config submodule.src/deps/geompp.url "$srcdir/geompp"
  git config submodule.src/deps/fltk.url "$srcdir/fltk"
  git config submodule.src/deps/concurrentqueue.url "$srcdir/concurrentqueue"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE='None' \
      -DWITH_VST2=OFF \
      -DWITH_VST3=ON \
      -DWITH_SYSTEM_JSON=ON \
      -DWITH_TESTS=ON \
      -W no-dev \
      -B build \
      -S .

  make VERBOSE=1 -C build
}

check(){
  cd "$pkgname"
  xvfb-run ./build-test/giada --run-tests
}

package() {
  depends+=('libasound.so' 'libfreetype.so' 'libjack.so'
  'libpulse.so' 'libpulse-simple.so' 'librtmidi.so' 'libsamplerate.so'
  'libsndfile.so')
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install -C build

  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
