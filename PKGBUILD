# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=PaulXStretch
pkgname=${_name,,}
pkgver=1.6.0
pkgrel=3
pkgdesc='Extreme time stretching tool (standalone, VST3 and CLAP plugin)'
arch=(aarch64 x86_64)
url='https://sonosaurus.com/paulxstretch/'
license=(GPL-3.0-only)
depends=(gcc-libs)
makedepends=(alsa-lib cmake fftw freetype2 jack libx11 libxcursor libxinerama libxrandr)
optdepends=('alsa-lib: for standalone ALSA support'
            'clap-host: for CLAP plugin'
            'jack: for standalone JACK support'
            'vst3-host: for VST3 plugin')
groups=(clap-plugins pro-audio vst3-plugins)
source=("$pkgname-$pkgver.tar.gz::https://github.com/essej/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'fix-juce-x11.patch::https://github.com/juce-framework/JUCE/commit/4f9a9c7b.patch')
sha256sums=('460b569c64dc5be57a963b863adc1b2606dc14a264701d8c983df3d3b6f7944d'
            '0786e34ce5b3db2047a6999dbe22d722df9344da9f0719d725beec9501d93d48')

prepare() {
  cd $pkgname-$pkgver/deps/juce
  # Fix scan failing on xinit sessions, see https://github.com/essej/paulxstretch/issues/23
  patch -Np1 -i "$srcdir"/fix-juce-x11.patch || true
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
  install -vDm755 CLAP/${_name}.clap -t "$pkgdir"/usr/lib/clap
}
