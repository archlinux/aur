# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

_pkgname=mumble
pkgname="$_pkgname-git"
pkgver=1.4.0.development.snapshot.006.r605.g74faaba32
pkgrel=1
epoch=1
pkgdesc='An Open Source, low-latency, high quality voice chat software (git version)'
arch=('i686' 'x86_64')
url='https://www.mumble.info'
license=('BSD')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libspeechd' 'libx11'
         'libxi' 'openssl' 'opus' 'poco' 'rnnoise' 'qt5-base' 'qt5-svg'
         'speex' 'xdg-utils')
makedepends=('alsa-lib' 'avahi' 'boost' 'cmake' 'git' 'jack' 'lib32-gcc-libs'
             'libpulse' 'libsndfile' 'mesa' 'microsoft-gsl' 'nlohmann-json'
             'pipewire' 'protobuf' 'python' 'qt5-tools' 'speech-dispatcher')
optdepends=('speech-dispatcher: Text-to-Speech support'
            'espeak-ng: Text-to-Speech support'
            'pipewire: PipeWire audio support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/mumble-voip/mumble.git'
        'git+https://github.com/mumble-voip/minhook.git'
        'git+https://github.com/mumble-voip/mach_override.git'
        'git+https://github.com/mumble-voip/speexdsp.git'
        'git+https://github.com/mumble-voip/rnnoise.git'
        'git+https://github.com/Krzmbrzl/FindPythonInterpreter.git'
        'git+https://github.com/wolfpld/tracy.git'
        'git+https://github.com/ArthurSonzogni/nlohmann_json_cmake_fetchcontent'
        'git+https://github.com/microsoft/GSL.git'
        'git+https://github.com/rigtorp/SPSCQueue.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
  git config submodule.3rdparty/FindPythonInterpreter.url "$srcdir/FindPythonInterpreter"
  git config submodule.3rdparty/tracy.url "$srcdir/tracy"
  git config submodule.3rdparty/nlohmann_json.url "$srcdir/nlohmann_json_cmake_fetchcontent"
  git config submodule.3rdparty/gsl.url "$srcdir/GSL"
  git config submodule.3rdparty/SPSCQueue.url "$srcdir/SPSCQueue"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_pkgname"

  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Dwarnings-as-errors='OFF' \
    -Dclient='ON' \
    -Dserver='OFF' \
    -Dbundled-celt='ON' \
    -Dbundled-gsl='OFF' \
    -Dbundled-json='OFF' \
    -Dbundled-opus='OFF' \
    -Dbundled-rnnoise='OFF' \
    -Dbundled-speex='OFF' \
    -Dupdate='OFF' \
    -Wno-dev
  make -C build
}

package() {
  depends+=('libasound.so' 'libdns_sd.so' 'libjack.so' 'libprotobuf.so'
            'libpulse.so' 'libsndfile.so')
  cd "$_pkgname"
  make -C build DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
