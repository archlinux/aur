# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

_pkgname=mumble
pkgname="$_pkgname-git"
pkgver=1.4.0.development.snapshot.006.r420.gad83b4b57
pkgrel=1
epoch=1
pkgdesc='An Open Source, low-latency, high quality voice chat software (git version)'
arch=('i686' 'x86_64')
url='https://www.mumble.info'
license=('BSD')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libspeechd' 'libx11' 'libxi'
         'openssl' 'opus' 'poco' 'qt5-base' 'qt5-svg' 'speex' 'xdg-utils')
makedepends=('alsa-lib' 'avahi' 'boost' 'cmake' 'git' 'jack' 'lib32-gcc-libs'
             'libpulse' 'libsndfile' 'mesa' 'pipewire' 'protobuf' 'python'
             'qt5-tools' 'speech-dispatcher')
optdepends=('speech-dispatcher: Text-to-Speech support'
            'espeak-ng: Text-to-Speech support'
            'pipewire: PipeWire audio support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git://github.com/mumble-voip/mumble.git'
        'git://github.com/mumble-voip/celt-0.7.0.git'
        'git://github.com/mumble-voip/opus.git'
        'git://github.com/mumble-voip/speex.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git submodule init
  git config submodule.3rdparty/celt-0.7.0-src.url "$srcdir/celt"
  git config submodule.3rdparty/opus.url "$srcdir/opus"
  git config submodule.3rdparty/speex.url "$srcdir/speex"
  git submodule update
}

build() {
  cd "$_pkgname"

  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Dwarnings-as-errors:BOOL='OFF' \
    -Dclient:BOOL='ON' \
    -Dserver:BOOL='OFF' \
    -Dbundled-celt:BOOL='ON' \
    -Dbundled-opus:BOOL='OFF' \
    -Dbundled-speex:BOOL='OFF' \
    -Dupdate:BOOL='OFF' \
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
