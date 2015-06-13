# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=sdrangelove-git
pkgver=20140824
pkgrel=1
pkgdesc="A high speed SDR waterfall display."
arch=('i686' 'x86_64')
url="http://sdr.osmocom.org/trac/wiki/sdrangelove"
license=('GPL')
depends=('qt5-multimedia' 'gnuradio-osmosdr' 'libpulse' 'boost-libs')
# build with gr-osmosdr for more hardware
makedepends=('git' 'cmake' 'boost')
optdepends=('pulseaudio: sound output')
conflicts=('sdrangelove')
source=("git://git.osmocom.org/sdrangelove.git")
md5sums=('SKIP')

_gitname="sdrangelove"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}


build() {
  cd "$srcdir/$_gitname"
  # todo, tetra needs the API changes from eeb7a07683c applied
  #sed -i 's|#\(.*tetra.*\)|\1|' plugins/channel/CMakeLists.txt
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -Wno-dev ../
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  # missing target and sane linking
  #make DESTDIR="$pkgdir" install
  install -Dm755 sdrangelove "$pkgdir/opt/$pkgname/sdrangelove"
  install -Dm755 libsdrbase.so "$pkgdir/opt/$pkgname/libsdrbase.so"

  # all the plugins
  #cp -r plugins "$pkgdir/opt/$pkgname/"
  pushd plugins/samplesource/gnuradio
  install -Dm755 libinputgnuradio.so "$pkgdir/opt/$pkgname/plugins/samplesource/gnuradio/libinputgnuradio.so"
  install -Dm644 ui_gnuradiogui.h "$pkgdir/opt/$pkgname/plugins/samplesource/gnuradio/ui_gnuradiogui.h"
  popd
  pushd plugins/samplesource/rtlsdr
  install -Dm755 libinputrtlsdr.so "$pkgdir/opt/$pkgname/plugins/samplesource/rtlsdr/libinputrtlsdr.so"
  install -Dm644 ui_rtlsdrgui.h "$pkgdir/opt/$pkgname/plugins/samplesource/rtlsdr/ui_rtlsdrgui.h"
  popd
  pushd plugins/channel/nfm
  install -Dm755 libdemodnfm.so "$pkgdir/opt/$pkgname/plugins/channel/nfm/libdemodnfm.so"
  install -Dm644 ui_nfmdemodgui.h "$pkgdir/opt/$pkgname/plugins/channel/nfm/ui_nfmdemodgui.h"
  popd
  pushd plugins/channel/tcpsrc
  install -Dm755 libdemodtcpsrc.so "$pkgdir/opt/$pkgname/plugins/channel/tcpsrc/libdemodtcpsrc.so"
  install -Dm644 ui_tcpsrcgui.h "$pkgdir/opt/$pkgname/plugins/channel/tcpsrc/ui_tcpsrcgui.h"
  popd
  # todo, tetra

  mkdir -p "$pkgdir/usr/bin"
  echo -e "#!/bin/bash\ncd /opt/sdrangelove-git/\nLD_LIBRARY_PATH=./ ./sdrangelove\ncd -" > "$pkgdir/usr/bin/sdrangelove"
  #echo -e "#!/bin/bash\npulseaudio --start\nsdrangelove\npulseaudio -k" > "$pkgdir/usr/bin/sdrangelove-alsa"
  chmod +x "$pkgdir/usr/bin/sdrangelove"
  #chmod +x "$pkgdir/usr/bin/sdrangelove-alsa"
}

# vim:set ts=2 sw=2 et:
