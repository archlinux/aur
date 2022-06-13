# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=PaulXStretch
pkgname=${_name,,}
pkgver=1.5.3
pkgrel=2
pkgdesc='Extreme time stretching application and plugin'
arch=(x86_64 aarch64)
url='https://sonosaurus.com/paulxstretch/'
license=(GPL3)
depends=(gcc-libs)
makedepends=(alsa-lib cmake fftw freetype2 jack libx11 libxcursor libxinerama libxrandr)
optdepends=('alsa-lib: for standalone ALSA support'
            'jack: for standalone JACK support'
            'vst3-host: for VST3 plugin')
groups=(pro-audio vst3-plugins)
source=("$pkgname-$pkgver.tar.gz::https://github.com/essej/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'fix-gcc12.patch')
sha256sums=('89b95f0006256b049dc90518b966050dbbd770ad1a70fad6124f840fa870b7ca'
            '25ccf8d99d5a115ba487167220b53635023054215306de1c65ba4a24bef16c66')

prepare() {
  cd $pkgname-$pkgver
  # fix JUCE build error in gcc12
  # https://github.com/essej/paulxstretch/issues/16
  patch -p1 -i ../fix-gcc12.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  depends+=(libfreetype.so libfftw3f.so)
  cd $pkgname-$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 images/${pkgname}_icon_256_rounded.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -vDm644 linux/$pkgname.desktop -t "$pkgdir"/usr/share/applications

  cd "$srcdir"/build/${_name}_artefacts/Release
  install -vDm755 Standalone/* -t "$pkgdir"/usr/bin
  install -vDm755 VST3/${_name}.vst3/Contents/$CARCH-linux/*.so \
    -t "$pkgdir"/usr/lib/vst3/${_name}.vst3/Contents/$CARCH-linux
}
