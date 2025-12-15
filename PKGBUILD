# Maintainer: ipha00 gmail com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Stijn Segers <francesco dot borromini at gmail dot com>

_name=FreeRDP
_pkgnbase=freerdp
pkgname=freerdp-sdl3
pkgver=3.19.1
_libver=${pkgver/.*/}
pkgrel=1
epoch=1
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP) (SDL3 only)"
arch=(x86_64)
url="https://www.freerdp.com/"
license=(Apache-2.0)
conflicts=(freerdp)
depends=(
  fuse3
  gcc-libs
  glibc
  libcups
  sdl3
  sdl3_ttf
  # not sure what these are used for
  libx11
  libxfixes
  libxext
)
makedepends=(
  alsa-lib
  cmake
  e2fsprogs
  ffmpeg
  icu
  json-c
  krb5
  libjpeg-turbo
  libp11
  libpng
  libpulse
  libusb
  libwebp
  openssl
  pam
  pkcs11-helper
  zlib
)
provides=(
  libfreerdp-client$_libver.so
  libfreerdp-server-proxy$_libver.so
  libfreerdp-server$_libver
  libfreerdp-shadow-subsystem$_libver.so
  libfreerdp-shadow$_libver.so
  libfreerdp$_libver.so
  libwinpr-tools$_libver.so
  libwinpr$_libver.so
)
source=(
  https://github.com/$_pkgnbase/$_pkgnbase/archive/$pkgver/$_pkgnbase-$pkgver.tar.gz
)
sha256sums=('b16e15bcf7eeed5d36148dfefa9dac47a5799f973ef3112e94744b9035ca45c9')

build() {
  # gcc14 buildfix
  export CFLAGS+=" -Wno-incompatible-pointer-types"
  export CXXFLAGS+=" -Wno-incompatible-pointer-types"

  local cmake_options=(
    -B build
    -D CHANNEL_URBDRC_CLIENT=ON
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D PROXY_PLUGINDIR=/usr/lib/$_pkgnbase/server/proxy/plugins
    -D RDTK_FORCE_STATIC_BUILD=ON  # prevent file conflicts with freerdp2
    -D UWAC_FORCE_STATIC_BUILD=ON  # prevent file conflicts with freerdp2
    -D WITH_ALSA=ON
    -D WITH_BINARY_VERSIONING=ON  # prevent file conflicts with freerdp2
    -D WITH_CHANNELS=ON
    -D WITH_CLIENT_CHANNELS=ON
    -D WITH_CUPS=ON
    -D WITH_DSP_FFMPEG=ON
    -D WITH_FFMPEG=ON
    -D WITH_FUSE=ON
    -D WITH_ICU=ON
    -D WITH_JPEG=ON
    -D WITH_PCSC=ON
    -D WITH_PULSE=ON
    -D WITH_SERVER=ON
    -D WITH_SERVER_CHANNELS=ON
    -D WITH_SYSTEMD=ON
    -D WITH_SWSCALE=ON
    -D WITH_WAYLAND=OFF
    -D WITH_VERBOSE_WINPR_ASSERT=OFF
    -D WITH_WINPR_TOOLS=ON
    -D WITH_X11=OFF
    -D WINPR_UTILS_IMAGE_PNG=ON
    -D WINPR_UTILS_IMAGE_JPEG=ON
    -D WINPR_UTILS_IMAGE_WEBP=ON
    -D WITH_CLIENT_SDL2=OFF
    -D WITH_CLIENT_SDL3=ON
    -S $_name-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  depends+=(
    alsa-lib libasound.so
    e2fsprogs libcom_err.so
    ffmpeg libavcodec.so libavutil.so libswresample.so libswscale.so
    icu libicuuc.so
    json-c libjson-c.so
    krb5 libk5crypto.so libkrb5.so
    libjpeg-turbo libjpeg.so
    libpng libpng16.so
    libpulse libpulse.so
    libusb libusb-1.0.so
    libwebp libwebp.so
    openssl libcrypto.so libssl.so
    pam libpam.so
    zlib libz.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_name-$pkgver/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$_pkgnbase/"
}
