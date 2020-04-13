# Maintainer: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

_pkgname=mumble
pkgname="$_pkgname-git"
pkgver=1.3.0.rc2.r399.g7ed7d95f4
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
pkgdesc='A voice chat application similar to TeamSpeak (git version)'
url='https://www.mumble.info/'
license=('BSD')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libspeechd' 'libx11' 'libxi'
         'lsb-release' 'openssl' 'opus' 'qt5-base' 'qt5-svg' 'speex' 'xdg-utils')
makedepends=('alsa-lib' 'avahi' 'boost' 'jack' 'libpulse' 'libsndfile' 'mesa'
             'protobuf' 'python' 'qt5-tools' 'git')
optdepends=('speech-dispatcher: Text-to-speech support'
            'espeak-ng: Text-to-speech support')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git://github.com/mumble-voip/mumble.git' 'https://git.xiph.org/celt.git'
        'git://github.com/mumble-voip/fx11.git' 'git://github.com/mumble-voip/opus.git'
        'git://github.com/mumble-voip/sbcelt.git' 'https://git.xiph.org/speex.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git submodule init
  git config submodule.3rdparty/fx11-src.url "$srcdir/fx11"
  git config submodule.3rdparty/celt-0.7.0-src.url "$srcdir/celt"
  git config submodule.3rdparty/opus-src.url "$srcdir/opus"
  git config submodule.3rdparty/sbcelt-src.url "$srcdir/sbcelt"
  git config submodule.3rdparty/speex-src.url "$srcdir/speex"
  git submodule update
}

build() {
  cd "$_pkgname"
  qmake-qt5 main.pro \
    CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie \
             no-server no-embed-qt-translations no-update packaged" \
    DEFINES+="PLUGIN_PATH=/usr/lib/$_pkgname" \
    INCLUDEPATH+="/usr/include/speech-dispatcher"
  make release
}

package() {
  depends+=('libasound.so' 'libdns_sd.so' 'libjack.so' 'libprotobuf.so'
            'libpulse.so' 'libsndfile.so')
  cd "$_pkgname"
  # mumble has no install target: https://github.com/mumble-voip/mumble/issues/1029
  # binaries and scripts
  install -vDm 755 release/mumble -t "$pkgdir/usr/bin"
  install -vDm 755 scripts/mumble-overlay -t "$pkgdir/usr/bin/"
  # (vendored) libs
  install -vdm 755 "$pkgdir/usr/lib/$_pkgname/"
  local _lib
  for _lib in release/*.so*; do
    if [ -L "$_lib" ]; then
      cp -vP "$_lib" "$pkgdir/usr/lib/$_pkgname/"
    else
      install -vDm 755 "$_lib" -t "$pkgdir/usr/lib/$_pkgname/"
    fi
  done
  install -vDm 755 release/plugins/*.so -t "$pkgdir/usr/lib/$_pkgname/"
  # XDG desktop integration
  install -vDm 644 scripts/mumble.desktop -t "$pkgdir/usr/share/applications"
  # man page
  install -vDm 644 "man/${_pkgname}"*.1 -t "$pkgdir/usr/share/man/man1/"
  # XDG desktop icons
  install -vDm 644 icons/mumble.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  # license
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
