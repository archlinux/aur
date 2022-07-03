# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

# NOTE: can currently not be built using devtools:
# https://github.com/monocasual/giada/issues/553
pkgname=giada
pkgver=0.22.0
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=(x86_64)
url="https://www.giadamusic.com/"
license=(GPL3)
groups=(pro-audio)
depends=(gcc-libs glibc hicolor-icon-theme libx11 libxcursor libxft libxinerama libxpm fmt)
options=(!buildflags !makeflags)
# upstream vendors a hacked rtaudio :(
makedepends=(alsa-lib catch2 cmake fltk imagemagick jack libpulse libsamplerate libsndfile libxrandr nlohmann-json rtmidi sed)
checkdepends=(xorg-server-xvfb)
provides=(vst3-host giada)
source=(
  "https://www.giadamusic.com/data/${pkgname}-v${pkgver}-src.tar.gz" "giada-patches.patch"
)
sha512sums=('SKIP' 'SKIP')
b2sums=('SKIP' 'SKIP')

prepare() {
  cd "$pkgname-$pkgver-src"
  patch -p1 < ../giada-patches.patch
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DWITH_VST3=ON \
        -DWITH_SYSTEM_JSON=ON \
        -W no-dev \
        -B build \
        -S "$pkgname-$pkgver-src"
  #cmake -DCMAKE_INSTALL_PREFIX=/usr \
  #      -DCMAKE_BUILD_TYPE='None' \
  #      -DWITH_VST3=ON \
  #      -DWITH_SYSTEM_JSON=ON \
  #      -DWITH_TESTS=ON \
  #      -W no-dev \
  #      -B build-test \
  #      -S "$pkgname-$pkgver-src"

  #fix for libdl.so version
  sed -i "s/libdl.so/libdl.so.2/g" "build/CMakeFiles/giada.dir/build.make"
  make VERBOSE=1 -C build
  #make VERBOSE=1 -C build-test
}

#check(){
#  xvfb-run ./build-test/giada --run-tests
#}

package() {
  depends+=(libasound.so libfreetype.so libjack.so libpulse.so
  libpulse-simple.so librtmidi.so libsamplerate.so libsndfile.so)

  make DESTDIR="$pkgdir/" install -C build
  # docs
  install -vDm 644 "$pkgname-$pkgver-src/"{ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
