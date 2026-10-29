# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

_pkgname=mumble
pkgname="$_pkgname-git"
pkgver=1.6.870.r404.g0d15773d6
pkgrel=1
epoch=1
pkgdesc='An Open Source, low-latency, high quality voice chat software (git version)'
arch=('x86_64')
url='https://www.mumble.info'
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base')
makedepends=('alsa-lib' 'avahi' 'boost' 'cli11' 'cmake' 'git' 'hicolor-icon-theme'
             'jack' 'lib32-gcc-libs' 'libpulse' 'libsndfile' 'libspeechd'
             'libx11' 'libxi' 'mesa' 'nlohmann-json' 'openssl'
             'opus' 'poco' 'protobuf' 'python' 'qt6-svg' 'qt6-tools' 'rnnoise'
             'spdlog' 'speech-dispatcher' 'speexdsp' 'utf8cpp' 'xdg-utils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/mumble-voip/mumble.git'
        'git+https://github.com/mumble-voip/minhook.git'
        'git+https://github.com/Krzmbrzl/cmake-compiler-flags.git'
        'git+https://github.com/lipis/flag-icons.git'
        'git+https://github.com/wolfpld/tracy.git'
        'git+https://github.com/xiph/rnnoise.git'
        'git+https://github.com/xiph/speexdsp.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.3rdparty/minhook.url "$srcdir/minhook"
  git config submodule.3rdparty/speexdsp.url "$srcdir/speexdsp"
  git config submodule.3rdparty/rnnoise-src.url "$srcdir/rnnoise"
  git config submodule.3rdparty/tracy.url "$srcdir/tracy"
  git config submodule.3rdparty/cmake-compiler-flags.url "$srcdir/cmake-compiler-flags"
  git config submodule.3rdparty/flag-icons.url "$srcdir/flag-icons"

  git -c protocol.file.allow=always submodule update
}

build() {
  local cmake_options=(
    -B build
    -S "$_pkgname"
    -W no-author
    -D CMAKE_BUILD_TYPE='None'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D warnings-as-errors='OFF'
    -D client='ON'
    -D server='OFF'
    -D bundled-rnnoise='OFF'
    -D bundled-speex='OFF'
    -D update='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  # NOTE: jack, libpulse, and pipewire are dlopen'ed
  depends+=(
    'alsa-lib' 'libasound.so'
    'avahi' 'libdns_sd.so'
    'hicolor-icon-theme'
    'jack'
    'protobuf' 'libprotobuf.so'
    'libpulse'
    'libsndfile' 'libsndfile.so'
    'libspeechd'
    'libx11'
    'libxi'
    'openssl' 'libcrypto.so' 'libssl.so'
    'opus' 'libopus.so'
    'poco'
    'qt6-svg'
    'rnnoise'
    'spdlog'
    'speexdsp' 'libspeexdsp.so'
    'xdg-utils'
  )
  optdepends=(
    'lib32-glibc: For mumble-overlay'
    'espeak-ng: Text-to-speech support'
    'speech-dispatcher: Text-to-speech support'
    'pipewire: PipeWire audio support'
  )

  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
