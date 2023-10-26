# Maintainer:
# Contributor: Nathan Loewen <loewen.nathan@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Alexey Vasiliev <robbinton@gmail.com>

_pkgname="freerdp"
pkgname="$_pkgname-git"
pkgver=3.0.0beta4.r98.g32c65dbdf
pkgrel=1
pkgdesc="Free implementation of the Remote Desktop Protocol (RDP)"
arch=('i686' 'x86_64')
url="https://www.freerdp.com/"
license=('Apache')

depends=(
  # extra/freerdp
  glibc
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
)
makedepends=(
  # extra/freerdp
  alsa-lib
  cmake
  docbook-xsl
  ffmpeg
  icu
  krb5
  libjpeg-turbo
  libpulse
  libusb
  openssl
  pam
  systemd
  xmlto
  xorgproto
)
provides=(
  # extra/freerdp
  libfreerdp2.so
  libfreerdp-client2.so
  libfreerdp-server2
  libfreerdp-shadow2.so
  libfreerdp-shadow-subsystem2.so
  libwinpr2.so
  libwinpr-tools2.so
  libuwac0.so
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  # git package
  depends+=(
    'cjson'
    'fuse3'
    'pkcs11-helper'
    'sdl2_ttf'
    'webkit2gtk'
  )
  makedepends+=('git')

  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  url="https://github.com/FreeRDP/FreeRDP"

  source=("$_pkgname"::"git+$url.git")
  sha256sums=('SKIP')

  _pkgsrc="$_pkgname"

  pkgver() {
    cd "$srcdir/$_pkgsrc"
    git describe --long --tags --exclude='*android*' --exclude='*ios*' | sed -E 's/^v//;s@-(alpha|beta|rc)@\1@;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

build() {
  local _cmake_options=(
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_INSTALL_LIBDIR="/usr/lib"
    # -DCMAKE_BUILD_TYPE=None
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DPROXY_PLUGINDIR="/usr/lib/freerdp2/server/proxy/plugins"
    -DWITH_DSP_FFMPEG=ON
    -DWITH_FFMPEG=ON
    -DWITH_PULSE=ON
    -DWITH_CUPS=ON
    -DWITH_PCSC=ON
    -DWITH_ICU=ON
    -DWITH_JPEG=ON
    -DWITH_SERVER=ON
    -DWITH_SWSCALE=ON
    -DWITH_CHANNELS=ON
    -DWITH_CLIENT_CHANNELS=ON
    -DWITH_SERVER_CHANNELS=ON
    -DCHANNEL_URBDRC_CLIENT=ON
    -Wno-dev
    -B build
    -S "$_pkgsrc"

    -DCMAKE_BUILD_TYPE=Release
    -DWITH_X11=ON
    -DWITH_WAYLAND=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure || true
}

package() {
  depends+=(
    alsa-lib libasound.so
    ffmpeg libavcodec.so libavutil.so libswresample.so libswscale.so
    icu libicuuc.so
    libjpeg-turbo libjpeg.so
    libpulse libpulse.so
    libusb libusb-1.0.so
    openssl libcrypto.so libssl.so
    pam libpam.so
    systemd-libs libsystemd.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm0644 "$_pkgsrc"/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
