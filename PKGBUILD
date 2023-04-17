# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

# NOTE: can currently not be built using devtools:
# https://github.com/monocasual/giada/issues/553
pkgname=giada
pkgver=0.24.0
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=(x86_64)
url="https://www.giadamusic.com/"
license=(GPL3)
groups=(pro-audio)
depends=(gcc-libs glibc hicolor-icon-theme libx11 libxcursor libxft libxinerama libxpm fmt)
options=(!buildflags !makeflags)
# upstream vendors a hacked rtaudio :(
makedepends=(alsa-lib cmake imagemagick jack libpulse libsamplerate libsndfile libxrandr nlohmann-json rtmidi sed git)
checkdepends=(catch2)
provides=(vst3-host giada)
source=(
"$pkgname-$pkgver::git+https://github.com/monocasual/giada/#tag=v$pkgver" "git+https://github.com/juce-framework/JUCE.git"
"git+https://github.com/steinbergmedia/vst3sdk.git" "git+https://github.com/monocasual/rtaudio.git" "git+https://github.com/monocasual/geompp.git" "git+https://github.com/monocasual/mcl-audio-buffer.git" "git+https://github.com/monocasual/mcl-atomic-swapper.git" "git+https://github.com/fltk/fltk.git"
"fmt-gcc12.patch"
)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule init
  git config submodule.externals/vendor/JUCE.url "$srcdir/JUCE"
  git config submodule.externals/vendor/mcl-audio-buffer.url "$srcdir/mcl-audio-buffer"
  git config submodule.externals/vendor/mcl-atomic-swapper.url "$srcdir/mcl-atomic-swapper"
  git config submodule.externals/vendor/rtaudio.url "$srcdir/rtaudio"
  git config submodule.externals/vendor/vst3sdk.url "$srcdir/vst3sdk"
  git config submodule.externals/vendor/geompp.url "$srcdir/geompp"
  git config submodule.externals/vendor/fltk.url "$srcdir/fltk"
  git -c protocol.file.allow=always submodule update

  patch -p1 -i "../fmt-gcc12.patch"
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
  #fix for libdl.so version
  #sed -i "s/libdl.so/libdl.so.2/g" "build/CMakeFiles/giada.dir/build.make"
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
  # docs
  cd "$pkgname-$pkgver/"
  install -vDm 644 {ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
