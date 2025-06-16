# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=pluginval
pkgver=1.0.4
pkgrel=2
pkgdesc='Cross platform DAW plugin testing and validation tool'
arch=(x86_64 aarch64)
url='https://github.com/Tracktion/pluginval/'
license=(GPL-3.0-only)
depends=(freetype2 glibc gcc-libs)
makedepends=(alsa-lib cmake fontconfig git ladspa webkit2gtk)
groups=(pro-audio)
_juce_commit='5179f4e720d8406ebd1b5401c86aea8da6cc83c9'
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Tracktion/pluginval/archive/refs/tags/v$pkgver.tar.gz"
  "JUCE-$_juce_commit.tar.gz::https://github.com/juce-framework/JUCE/archive/$_juce_commit.tar.gz"
)

sha256sums=('f0d14c14743c694350d3bf9fbb06e752bb445f4d7cd3703520acc6758caa1c68'
            '74c34535a848687aaa2f283ad5e77033e5690df8d359fd1891cbe292928812c0')


prepare() {
  cd $pkgname-$pkgver
  test -d modules/juce && rmdir modules/juce
  ln -sf "$srcdir"/JUCE-$_juce_commit modules/juce
}

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev \
    -B $pkgname-$pkgver-build \
    -S $pkgname-$pkgver
  cmake --build $pkgname-$pkgver-build
}

package() {
  depends+=(libfontconfig.so libfreetype.so)
  install -vDm 755 $pkgname-$pkgver-build/${pkgname}_artefacts/None/$pkgname \
    -t "$pkgdir"/usr/bin
  # Docs
  cd $pkgname-$pkgver
  install -vDm 644 README.md docs/*.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 docs/images/*.png -t "$pkgdir"/usr/share/doc/$pkgname/images
}
