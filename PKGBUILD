# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.11.5
pkgrel=8
pkgdesc="Interactive SDR receiver waterfall for many devices."
arch=('x86_64')
url="http://gqrx.dk/"
license=('GPL')
depends=('qt5-svg' 'libpulse' 'gnuradio-osmosdr' 'libxkbcommon-x11')
makedepends=('boost')
#source=("$pkgname-$pkgver.tgz::https://github.com/csete/gqrx/archive/v$pkgver.tar.gz")
source=("https://github.com/csete/gqrx/releases/download/v$pkgver/gqrx-sdr-$pkgver-src.tar.xz")
md5sums=('fed4994d5c04daf70cb19e2393da7a04')

prepare() {
  cd "$srcdir/gqrx-sdr-$pkgver"
  echo "StartupNotify=false" >> gqrx.desktop

  # gnuradio 3.8 changes
  sed -i 's|sig_source_c.h|sig_source.h|'          src/applications/gqrx/receiver.h
  sed -i 's|multiply_const_ff.h|multiply_const.h|' src/applications/gqrx/receiver.h
  sed -i 's|multiply_cc.h|multiply.h|'             src/applications/gqrx/receiver.h
  sed -i 's|multiply_const_ff.h|multiply_const.h|' src/applications/gqrx/receiver.cpp
  sed -i 's|fir_filter_ccf.h|fir_filter_blk.h|'    src/dsp/filter/fir_decim.{h,cpp}
  sed -i 's|sub_cc.h|sub.h|'                       src/dsp/correct_iq_cc.h
  sed -i 's|/fir_filter_ccc.h|/fir_filter_blk.h|'  src/dsp/rx_filter.h
  sed -i 's|freq_xlating_fir_filter_ccc.h|freq_xlating_fir_filter.h|' src/dsp/rx_filter.h
  sed -i 's|fir_filter_fcc.h|fir_filter_blk.h|'    src/dsp/stereo_demod.h
  sed -i 's|fir_filter_fff.h|fir_filter.h|'        src/dsp/stereo_demod.h
  sed -i 's|multiply_cc.h|multiply.h|'             src/dsp/stereo_demod.h
  sed -i 's|multiply_ff.h|multiply.h|'             src/dsp/stereo_demod.h
  sed -i 's|multiply_const_ff.h|multiply_const.h|' src/dsp/stereo_demod.h
  sed -i 's|/add_ff.h|/add_blk.h|'                 src/dsp/stereo_demod.h
  sed -i 's|fir_filter_fff.h|fir_filter_blk.h|'    src/dsp/lpf.h
  sed -i 's|/fir_filter_ccc.h|/fir_filter_blk.h|'  src/dsp/rx_rds.h
  sed -i 's|/fir_filter_ccf.h|/fir_filter_blk.h|'  src/dsp/rx_rds.h
  sed -i 's|/fir_filter_fff.h|/fir_filter_blk.h|'  src/dsp/rx_rds.h
  sed -i 's|freq_xlating_fir_filter_fcf.h|freq_xlating_fir_filter.h|' src/dsp/rx_rds.h
  sed -i 's|freq_xlating_fir_filter_ccf.h|freq_xlating_fir_filter.h|' src/dsp/rx_rds.h

  cd "$srcdir"
  cp -r gqrx-sdr-$pkgver gqrx-$pkgver-alsa
  cd gqrx-$pkgver-alsa
  sed -i 's/AUDIO_BACKEND = pulse/#&/' gqrx.pro

}

build() {
  cd "$srcdir/$pkgname-sdr-$pkgver"
  rm -rf build
  mkdir build
  cd build
  qmake PREFIX=/usr/ ..
  sed -i 's|-lpthread|& -llog4cpp|' Makefile  # also 3.8 stuff
  make
  cd "$srcdir/$pkgname-$pkgver-alsa"
  rm -rf build
  mkdir build
  cd build
  qmake PREFIX=/usr/ ..
  sed -i 's|-lpthread|& -llog4cpp|' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-sdr-$pkgver"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "resources/icons/gqrx.svg" "$pkgdir/usr/share/pixmaps/gqrx.svg"

  cd "$srcdir/$pkgname-sdr-$pkgver/build"
  make install INSTALL_ROOT="$pkgdir"

  cd "$srcdir/$pkgname-$pkgver-alsa/build"
  install -Dm755 gqrx "$pkgdir/usr/bin/gqrx-alsa"
}

