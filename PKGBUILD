# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

_pkgname=mumble
pkgname="$_pkgname-git"
pkgver=1.4.0.development.snapshot.006.r2268.g5e86794bc
pkgrel=1
epoch=1
pkgdesc='An Open Source, low-latency, high quality voice chat software (git version)'
arch=('x86_64')
url='https://www.mumble.info'
license=('BSD')
depends=('gcc-libs' 'glibc' 'qt6-base')
makedepends=('alsa-lib' 'avahi' 'boost' 'cli11' 'cmake' 'git' 'hicolor-icon-theme'
             'jack' 'lib32-gcc-libs' 'libpulse' 'libsndfile' 'libspeechd'
             'libx11' 'libxi' 'mesa' 'nlohmann-json' 'openssl'
             'opus' 'poco' 'protobuf' 'python' 'qt6-svg' 'qt6-tools' 'rnnoise'
             'spdlog' 'speech-dispatcher' 'speexdsp' 'xdg-utils')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/mumble-voip/mumble.git'
        'git+https://github.com/mumble-voip/minhook.git'
        'git+https://github.com/mumble-voip/mach_override.git'
        'git+https://github.com/mumble-voip/SPSCQueue.git'
        'git+https://github.com/mumble-voip/utfcpp.git'
        'git+https://github.com/CLIUtils/CLI11.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/Krzmbrzl/cmake-compiler-flags.git'
        'git+https://github.com/lipis/flag-icons.git'
        'git+https://github.com/nlohmann/json.git'
        'git+https://github.com/SOCI/soci.git'
        'git+https://github.com/wolfpld/tracy.git'
        'git+https://github.com/xiph/rnnoise.git'
        'git+https://github.com/xiph/speexdsp.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.3rdparty/minhook.url "$srcdir/minhook"
  git config submodule.3rdparty/mach-override-src.url "$srcdir/mach_override"
  git config submodule.3rdparty/speexdsp.url "$srcdir/speexdsp"
  git config submodule.3rdparty/rnnoise-src.url "$srcdir/rnnoise"
  git config submodule.3rdparty/tracy.url "$srcdir/tracy"
  git config submodule.3rdparty/nlohmann_json.url "$srcdir/json"
  git config submodule.3rdparty/SPSCQueue.url "$srcdir/SPSCQueue"
  git config submodule.3rdparty/cmake-compiler-flags.url "$srcdir/cmake-compiler-flags"
  git config submodule.3rdparty/flag-icons.url "$srcdir/flag-icons"
  git config submodule.3rdparty/utfcpp.url "$srcdir/utfcpp"
  git config submodule.3rdparty/soci.url "$srcdir/soci"
  git config submodule.3rdparty/spdlog.url "$srcdir/spdlog"
  git config submodule.3rdparty/CLI11.url "$srcdir/CLI11"

  git -c protocol.file.allow=always submodule update
}

build() {
  cmake \
    -B build-client \
    -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Dwarnings-as-errors='OFF' \
    -Dclient='ON' \
    -Dserver='OFF' \
    -Dbundled-cli11='OFF' \
    -Dbundled-json='OFF' \
    -Dbundled-rnnoise='OFF' \
    -Dbundled-spdlog='OFF' \
    -Dbundled-speex='OFF' \
    -Dupdate='OFF' \
    -Wno-dev

  cmake --build build-client
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

  DESTDIR="$pkgdir" cmake --install build-client
  install -Dm 644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
