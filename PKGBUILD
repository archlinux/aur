# Maintainer: milkii on freenode
# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=spectmorph.lv2
pkgver=0.5.1
pkgrel=1
pkgdesc="Analyze samples of musical instruments and combine them (morphing)"
arch=('x86_64')
url="http://spectmorph.org/"
license=('LGPL3')
groups=('lv2-plugins' 'pro-audio' 'vst-plugins')
depends=('cairo' 'gcc-libs' 'glib2' 'glibc' 'libao' 'libglvnd' 'libx11' 'zlib')
makedepends=('fftw' 'freetype2' 'jack' 'lv2' 'libsndfile' 'qt5-base')
checkdepends=('lv2lint')
optdepends=('jack: for smjack and smsampleedit'
            'qt5-base: for sminspector and smsampleedit')
provides=('libspectmorphjack.so' 'libspectmorphgui.so' 'libspectmorphglui.so'
'libspectmorph.so')
conflicts=(spectmorph)
source=("http://www.spectmorph.org/files/releases/spectmorph-${pkgver}.tar.bz2"
        "http://spectmorph.org/files/instruments/spectmorph-instruments-${pkgver}.tar.xz")
sha512sums=('db5770266d1cdcb1dc64c369fc8ea9580741a8d7d766e3c298fdf175db4cf5daf2abb55213e3f6e9a93f42e103c86eb3b3dce10f2e945441c3048e847c811b01'
            '7cfb94b312a9d3f73dd0c87185cd398fdb3373ee4ec2e904033a1cbaa43296cd43a247dd81365cecd07609354c0bbd15cf2ee379fb36b890736f0cff1e7bc689')

prepare() {
  cd "spectmorph-$pkgver"
  autoreconf -vfi
}

build() {
  cd "spectmorph-$pkgver"
  ./configure --prefix=/usr \
              --with-lv2 \
              --without-jack \
              --without-qt
  make
}

check() {
  cd "spectmorph-$pkgver"
  cp -v lv2/.libs/*.so lv2/
  LV2_PATH="${PWD}" lv2lint "http://spectmorph.org/plugins/spectmorph" || echo "Known failing tests: https://github.com/swesterfeld/spectmorph/issues/8"
  rm -v lv2/*.so
}

package() {
  depends+=('libfftw3f.so' 'libfftw3f_threads.so' 'libfreetype.so'
  'libsndfile.so')
  cd "spectmorph-$pkgver"
  make DESTDIR="$pkgdir/" install
  # standard instruments
  install -vDm 644 ../instruments/standard/* \
    -t "${pkgdir}/usr/share/spectmorph/instruments/standard/"
  # docs
  install -vDm 644 {AUTHORS,DESIGN,NEWS,README.md,TODO} \
    -t "${pkgdir}/usr/share/doc/spectmorph/"
}
