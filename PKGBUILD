# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

_pkgname=mumble
pkgname="$_pkgname-git"
pkgver=1.3.0.rc2.r838.gf01920308
pkgrel=1
epoch=1
pkgdesc='A voice chat application similar to TeamSpeak (git version)'
arch=('i686' 'x86_64')
url='https://www.mumble.info'
license=('BSD')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libspeechd' 'libx11' 'libxi'
         'lsb-release' 'openssl' 'opus' 'qt5-base' 'qt5-svg' 'speex' 'xdg-utils')
makedepends=('alsa-lib' 'avahi' 'boost' 'jack' 'libpulse' 'libsndfile' 'mesa'
             'protobuf' 'python' 'qt5-tools' 'speech-dispatcher' 'cmake' 'git')
optdepends=('speech-dispatcher: Text-to-Speech support'
            'espeak-ng: Text-to-Speech support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git://github.com/mumble-voip/mumble.git'
        'git://github.com/mumble-voip/mumble-theme.git'
        'git://github.com/mumble-voip/celt-0.7.0.git'
        'git://github.com/mumble-voip/opus.git'
        'git://github.com/mumble-voip/speex.git'
        'build-type-release.patch'
        'no-bundled-opus.patch')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            '086374239b072df0034eed92d74917ab9af8db96fb0fcb01c36c111d6a134fe4'
            'bd2d9fea616a88fe4425bdf3396a0d9e0dfb735a7c06bcacd0858250ea96a2b0')

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
  git config submodule.themes/Mumble.url "$srcdir/mumble-theme"
  git submodule update

  # Workarounds to fix cmake build
  patch -Np1 -i "$srcdir/build-type-release.patch"
  patch -Np1 -i "$srcdir/no-bundled-opus.patch"
}

build() {
  CXXFLAGS+=" -DPLUGIN_PATH=/usr/lib/$_pkgname"
  cmake \
    -B "$_pkgname/build" \
    -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_TESTING:BOOL='OFF' \
    -Dclient:BOOL='ON' \
    -Dserver:BOOL='OFF' \
    -Dbundled-celt:BOOL='ON' \
    -Dbundled-opus:BOOL='OFF' \
    -Dbundled-speex:BOOL='OFF' \
    -Dupdate:BOOL='OFF' \
    -Wno-dev
  make -C "$_pkgname/build"
}

package() {
  depends+=('libasound.so' 'libdns_sd.so' 'libjack.so' 'libprotobuf.so'
            'libpulse.so' 'libsndfile.so')
  cd "$_pkgname"
  make -C build DESTDIR="$pkgdir" install

  # Fix location of libraries
  install -d "$pkgdir/usr/lib/$_pkgname"
  mv "$pkgdir/usr/lib/"libcelt* "$pkgdir/usr/lib/$_pkgname/"
  mv "$pkgdir/usr/lib/plugins/"*.so "$pkgdir/usr/lib/$_pkgname/"
  rmdir "$pkgdir/usr/lib/plugins"

  # Man page
  install -vDm 644 "man/$_pkgname".1 -t "$pkgdir/usr/share/man/man1/"

  # License
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
