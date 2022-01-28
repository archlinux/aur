# Maintainer: David Runge <dvzrv@archlinux.org>

# NOTE: can currently not be built using devtools:
# https://github.com/monocasual/giada/issues/553
pkgname=giada
pkgver=0.20.0
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=(x86_64)
url="https://www.giadamusic.com/"
license=(GPL3)
groups=(pro-audio)
depends=(gcc-libs glibc hicolor-icon-theme libx11 libxcursor libxft libxinerama
libxpm)
# upstream vendors a hacked rtaudio :(
makedepends=(alsa-lib catch2 cmake fltk imagemagick jack libpulse libsamplerate
libsndfile libxrandr nlohmann-json rtmidi)
checkdepends=(xorg-server-xvfb)
provides=(vst3-host)
source=(
  "https://www.giadamusic.com/data/${pkgname}-v${pkgver}-src.tar.gz"
  "$pkgname-0.19.0-devendor_nlohmann_json.patch"
)
sha512sums=('3aecc14ac2e31121d4d91b334defd969a5c57384fe44bbcfd672547458b6869d31f9dce91d2e0a452519c5713b29bfc01381c53ebf99d227df35131fc00efe0c'
            '4a6be28c0ba1656e4ce63504c031d6a89ae5fdf10a5652021e5a248e3202526095d097cf1337adf03efa7f618a485aadeb5b6024f15950a7b72cd23ad8cd97d6')
b2sums=('88920da19be8a33da5da9a1b0d29cac26fa84a32401886233af286c086c9cd27312a8f01b4b6271ad6392ae67ea0cee727195250f4129b365203f3c0e7d28896'
        '41fce95d1df10e78c080553184bb078abe30eec7ca85b9d3883ffd2191e4b51decee9c946f0b1aa10852e054c28a4e5f8bde62d4f0093d95e6197df464f61e59')

prepare() {
  cd "$pkgname-$pkgver-src"
  # devendor nlohmann-json
  patch -Np1 -i ../"$pkgname-0.19.0-devendor_nlohmann_json.patch"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DWITH_VST3=ON \
        -W no-dev \
        -B build \
        -S "$pkgname-$pkgver-src"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DWITH_VST3=ON \
        -DWITH_TESTS=ON \
        -W no-dev \
        -B build-test \
        -S "$pkgname-$pkgver-src"
  make VERBOSE=1 -C build
  make VERBOSE=1 -C build-test
}

check(){
  xvfb-run ./build-test/giada --run-tests
}

package() {
  depends+=(libasound.so libfreetype.so libjack.so libpulse.so
  libpulse-simple.so librtmidi.so libsamplerate.so libsndfile.so)

  make DESTDIR="$pkgdir/" install -C build
  # docs
  install -vDm 644 "$pkgname-$pkgver-src/"{ChangeLog,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
