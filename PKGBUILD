# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

# NOTE: can currently not be built using devtools:
# https://github.com/monocasual/giada/issues/553
pkgname=giada
pkgver=0.26.1
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=(x86_64)
url="https://www.giadamusic.com/"
license=(GPL3)
groups=(pro-audio)
depends=(gcc-libs glibc hicolor-icon-theme libx11 libxcursor libxft libxinerama libxpm fmt libsm libxrender libxext libxfixes fontconfig libice python libxrandr)
options=(!buildflags !makeflags)
# upstream vendors a hacked rtaudio :(
makedepends=(alsa-lib cmake imagemagick jack libpulse libsamplerate libsndfile nlohmann-json rtmidi git)
checkdepends=(catch2-v2)
provides=(vst3-host giada)
source=(
"$pkgname-$pkgver::git+https://github.com/monocasual/giada/#tag=$pkgver"
"git+https://github.com/juce-framework/JUCE.git#commit=69795dc"

"git+https://github.com/steinbergmedia/vst3sdk.git#commit=ef0a70d"

"git+https://github.com/monocasual/rtaudio.git#commit=8a362b1"

"git+https://github.com/monocasual/geompp.git#commit=dd75643"

"git+https://github.com/monocasual/mcl-audio-buffer.git#commit=d641e3e"

"git+https://github.com/monocasual/mcl-atomic-swapper.git#commit=459d45d"

"git+https://github.com/fltk/fltk.git#commit=06d1289"

"git+https://github.com/cameron314/concurrentqueue.git#commit=bf1fe24"
)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DWITH_VST3=ON \
        -DWITH_SYSTEM_JSON=ON \
        -DWITH_TESTS=ON \
        -W no-dev \
        -B build \
        -S "$pkgname-$pkgver"

  make VERBOSE=1 -C build
}

check(){
  cd "build/"
  ./giada --run-tests
}

package() {
  depends+=(libasound.so libfreetype.so libjack.so libpulse.so
  libpulse-simple.so librtmidi.so libsamplerate.so libsndfile.so)

  make DESTDIR="$pkgdir/" install -C build
  cd "$pkgname-$pkgver/"
  install -vDm 644 {ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -rv "${pkgdir}/usr/include/"
  rm -rv "${pkgdir}/usr/lib/"
  rm -rv "${pkgdir}/usr/bin/JUCE-7.0.5"
}
