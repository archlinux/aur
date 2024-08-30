# Maintainer:
# Contributor: Nathan Loewen <loewen.nathan@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

## links
# https://www.freerdp.com/
# https://github.com/FreeRDP/FreeRDP

_pkgname="freerdp"
pkgname="$_pkgname-git"
pkgver=3.7.0.r148.gd02a30e
pkgrel=1
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
url="https://github.com/FreeRDP/FreeRDP"
license=('Apache-2.0')
arch=('i686' 'x86_64')

depends=(
  libcups
  libx11
  libxcursor
  libxext
  libxdamage
  libxfixes
  libxkbcommon
  libxi
  libxinerama
  libxkbfile
  libxrandr
  libxrender
  libxtst
  pcsclite
  wayland

  libasound.so     # alsa-lib
  libavcodec.so    # ffmpeg
  libavutil.so     # ffmpeg
  libcrypto.so     # openssl
  libicuuc.so      # icu
  libjpeg.so       # libjpeg-turbo
  libpam.so        # pam
  libpulse.so      # libpulse
  libssl.so        # openssl
  libswresample.so # ffmpeg
  libswscale.so    # ffmpeg
  libsystemd.so    # systemd-libs
  libusb-1.0.so    # libusb

  # git
  cjson
  fuse3
  pkcs11-helper
  sdl2_ttf
  webkit2gtk
)
makedepends=(
  cmake
  docbook-xsl
  git
  krb5
  ninja
  xmlto
  xorgproto
)

provides=(
  "$_pkgname=2:${pkgver%.r*}"
  libfreerdp2.so
  libfreerdp-client2.so
  libfreerdp-server2
  libfreerdp-shadow2.so
  libfreerdp-shadow-subsystem2.so
  libwinpr2.so
  libwinpr-tools2.so
  libuwac0.so
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

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_BUILD_TYPE=None
    -DCHANNEL_URBDRC_CLIENT=ON
    -DPROXY_PLUGINDIR="/usr/lib/freerdp2/server/proxy/plugins"
    -DWITH_CHANNELS=ON
    -DWITH_CLIENT_CHANNELS=ON
    -DWITH_CUPS=ON
    -DWITH_DSP_FFMPEG=ON
    -DWITH_FFMPEG=ON
    -DWITH_ICU=ON
    -DWITH_JPEG=ON
    -DWITH_PCSC=ON
    -DWITH_PULSE=ON
    -DWITH_SERVER=ON
    -DWITH_SERVER_CHANNELS=ON
    -DWITH_SWSCALE=ON
    -DWITH_WAYLAND=ON
    -DWITH_X11=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure || true
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
