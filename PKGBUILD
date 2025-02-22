# Maintainer:
# Contributor: Nathan Loewen <loewen.nathan@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

## links
# https://www.freerdp.com/
# https://github.com/FreeRDP/FreeRDP

## options
: ${_build_sdl3:=false}

_pkgname="freerdp"
pkgname="$_pkgname-git"
pkgver=3.12.0.r53.g11e980a
pkgrel=1
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
url="https://github.com/FreeRDP/FreeRDP"
license=('Apache-2.0')
arch=('i686' 'x86_64')

depends=(
  fuse3
  uriparser
  libcups
  libx11
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbfile
  libxrandr
  libxrender
  libxtst
  pcsclite
  pkcs11-helper
  sdl2
  sdl2_ttf
  wayland
)
makedepends=(
  alsa-lib
  cjson
  cmake
  e2fsprogs
  ffmpeg
  git
  icu
  krb5
  libjpeg-turbo
  libp11
  libpng
  libpulse
  libusb
  libwebp
  ninja
  openssl
  pam
  zlib
)

if [[ "${_build_sdl3::1}" == "t" ]]; then
  depends+=(
    sdl3
    sdl3_ttf
  )
fi

_libver=${pkgver/.*/}
provides=(
  "$_pkgname=2:${pkgver%.r*}"
  libfreerdp$_libver.so
  libfreerdp-client$_libver.so
  libfreerdp-server$_libver
  libfreerdp-server-proxy$_libver.so
  libfreerdp-shadow$_libver.so
  libfreerdp-shadow-subsystem$_libver.so
  libwinpr$_libver.so
  libwinpr-tools$_libver.so
)
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # allow None build type
  sed -E -e '/SUPPORTED_BUILD_TYPES/s/Debug/None/' -i "$_pkgsrc/cmake/CommonConfigOptions.cmake"

  # fix check_ipo_supported
  sed -E -e '/check_ipo_supported/s/\)/ LANGUAGES C)/' -i "$_pkgsrc/cmake/CommonConfigOptions.cmake"

  if [ "${_build_sdl3::1}" != "t" ]; then
    sed -E -e 's&^.*find_package\(SDL3\).*$&set(SDL3_FOUND OFF)&' -i "$_pkgsrc/client/SDL/CMakeLists.txt"
  fi
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DCHANNEL_RDPECAM_CLIENT=ON
    -DCHANNEL_URBDRC_CLIENT=ON
    -DPROXY_PLUGINDIR="/usr/lib/$_pkgname/server/proxy/plugins"
    -DRDTK_FORCE_STATIC_BUILD=ON # prevent file conflicts with freerdp2
    -DUWAC_FORCE_STATIC_BUILD=ON # prevent file conflicts with freerdp2
    -DWINPR_UTILS_IMAGE_JPEG=ON
    -DWINPR_UTILS_IMAGE_PNG=ON
    -DWINPR_UTILS_IMAGE_WEBP=ON
    -DWITH_ALSA=ON
    -DWITH_BINARY_VERSIONING=ON # prevent file conflicts with freerdp2
    -DWITH_CHANNELS=ON
    -DWITH_CLIENT_CHANNELS=ON
    -DWITH_CUPS=ON
    -DWITH_DSP_FFMPEG=ON
    -DWITH_FFMPEG=ON
    -DWITH_FUSE=ON
    -DWITH_ICU=ON
    -DWITH_JPEG=ON
    -DWITH_PCSC=ON
    -DWITH_PULSE=ON
    -DWITH_SERVER=ON
    -DWITH_SERVER_CHANNELS=ON
    -DWITH_SWSCALE=ON
    -DWITH_SYSTEMD=ON
    -DWITH_VERBOSE_WINPR_ASSERT=OFF
    -DWITH_WAYLAND=ON
    -DWITH_WINPR_TOOLS=ON
    -DWITH_X11=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  if [ "${_build_sdl3::1}" != "t" ]; then
    _cmake_options+=(-DWITH_CLIENT_SDL3=OFF)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure || true
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
}
