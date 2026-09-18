# Maintainer:
# Contributor: Nathan Loewen <loewen.nathan@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

: ${_use_sodeps:=false}

_pkgname="freerdp"
pkgname="$_pkgname-git"
pkgver=3.31.1.r263.g839dcaf
pkgrel=3
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
url="https://github.com/FreeRDP/FreeRDP"
license=('Apache-2.0')
arch=('i686' 'x86_64')

depends=(
  alsa-lib
  ffmpeg
  freerdp-git
  fuse3
  glib2
  gtk3
  icu
  jansson
  krb5
  libcbor
  libcups
  libfido2
  libjpeg-turbo
  libpng
  libpulse
  libusb
  libwebp
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
  openssl
  pam
  sdl3
  sdl3_ttf
  sndio
  wayland
  zlib

  uriparser
  webkit2gtk-4.1
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

_libver=${pkgver%%.*}
provides=(
  "$_pkgname=2:${pkgver%.r*}"
  "libfreerdp$_libver.so"
  "libfreerdp-client$_libver.so"
  "libfreerdp-server$_libver.so"
  "libfreerdp-server-proxy$_libver.so"
  "libfreerdp-shadow$_libver.so"
  "libfreerdp-shadow-subsystem$_libver.so"
  "libwinpr$_libver.so"
  "libwinpr-tools$_libver.so"
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
    -DBUILD_TESTING=OFF
    -Wno-author

    -D CHANNEL_RDPECAM_CLIENT=ON
    -D CHANNEL_RDPEWA=ON
    -D CHANNEL_RDPEWA_CLIENT=ON
    -D CHANNEL_URBDRC_CLIENT=ON
    -D PROXY_PLUGINDIR="/usr/lib/$_pkgname/server/proxy/plugins"
    -D RDTK_FORCE_STATIC_BUILD=ON # prevent file conflicts with freerdp2
    -D UWAC_FORCE_STATIC_BUILD=ON # prevent file conflicts with freerdp2
    -D WINPR_UTILS_IMAGE_JPEG=ON
    -D WINPR_UTILS_IMAGE_PNG=ON
    -D WINPR_UTILS_IMAGE_WEBP=ON
    -D WITH_ALSA=ON
    -D WITH_BINARY_VERSIONING=ON # prevent file conflicts with freerdp2
    -D WITH_CHANNELS=ON
    -D WITH_CLIENT_CHANNELS=ON
    -D WITH_CLIENT_SDL2=OFF
    -D WITH_CLIENT_SDL3=ON
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
    -D WITH_SWSCALE=ON
    -D WITH_SYSTEMD=ON
    -D WITH_VAAPI=ON
    -D WITH_VERBOSE_WINPR_ASSERT=OFF
    -D WITH_WAYLAND=ON
    -D WITH_WINPR_TOOLS=ON
    -D WITH_X11=ON

    -D WITH_WEBVIEW_AAD_AUTH_HELPER=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure || true
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      libasound.so
      libavcodec.so
      libavutil.so
      libcbor.so
      libcrypto.so
      libfido2.so
      libicuuc.so
      libjpeg.so
      libk5crypto.so
      libkrb5.so
      libpam.so
      libpng16.so
      libpulse.so
      libssl.so
      libswresample.so
      libswscale.so
      libusb-1.0.so
      libwebkit2gtk-4.1.so
      libwebp.so
      libz.so
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build
}
