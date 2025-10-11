# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

# NOTE: can currently not be built using devtools:
# https://github.com/monocasual/giada/issues/553
pkgname=giada
pkgver=1.3.0
pkgrel=2
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=(x86_64)
url="https://www.giadamusic.com/"
license=(GPL-3.0-or-later)
groups=(pro-audio)
depends=(gcc-libs glibc hicolor-icon-theme libx11 libxcursor libxft libxinerama libxpm fmt libsm libxrender libxext libxfixes fontconfig libice python libxrandr)
options=(!buildflags !makeflags)
# upstream vendors a hacked rtaudio :(
makedepends=(alsa-lib cmake imagemagick jack libpulse libsamplerate libsndfile nlohmann-json rtmidi git)
checkdepends=(catch2)
provides=(vst3-host giada)
source=(
"git+https://github.com/monocasual/giada/#tag=$pkgver"
"git+https://github.com/juce-framework/JUCE.git"

"git+https://github.com/steinbergmedia/vst3sdk.git"

"git+https://github.com/monocasual/rtaudio.git"

"git+https://github.com/monocasual/geompp.git"

"git+https://github.com/monocasual/mcl-audio-buffer.git"

"git+https://github.com/monocasual/mcl-atomic-swapper.git"

"git+https://github.com/fltk/fltk.git"

"git+https://github.com/cameron314/concurrentqueue.git"
)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  git -C rtaudio remote add network-origin https://github.com/monocasual/rtaudio.git
  git -C rtaudio fetch network-origin 8a362b1082ce17d3be1f47bd116839e40f189cf1
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DWITH_VST3=ON \
        -DWITH_SYSTEM_JSON=ON \
        -DWITH_TESTS=ON \
        -W no-dev \
        -B build \
        -S "$pkgname"

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
  cd "$pkgname"
  install -Dm 644 {ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
  cd "src/deps/juce"
  _JUCE_Ver=$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  rm -r "${pkgdir}/usr/include/"
  rm -r "${pkgdir}/usr/lib/"
  rm -r "${pkgdir}/usr/bin/JUCE-${_JUCE_Ver}"
  rm "${pkgdir}/usr/bin/fltk-config"
  rm -r "${pkgdir}/usr/share/fltk/"
  rm -r "${pkgdir}/usr/share/man/"
}
