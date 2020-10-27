# Maintainer: Jendrik <xunilhcra at jendrik dot eu>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake-no-qsv' 'handbrake-no-qsv-cli')
pkgver=1.3.3
pkgrel=4
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL')
_commondeps=('libxml2' 'libass' 'libvorbis' 'opus' 'speex' 'libtheora' 'lame'
             'x264' 'jansson' 'libvpx' 'libva' 'numactl' 'bzip2' 'gcc-libs'
             'zlib' 'xz')
_guideps=('gst-plugins-base' 'gtk3' 'librsvg' 'libgudev')
makedepends=('intltool' 'python' 'nasm' 'wget' 'cmake' 'meson'
             "${_commondeps[@]}" "${_guideps[@]}")
source=(https://github.com/HandBrake/HandBrake/releases/download/$pkgver/HandBrake-$pkgver-source.tar.bz2{,.sig}
        handbrake-fix-close-button-in-about-dialog.patch::https://github.com/HandBrake/HandBrake/commit/d3eb4a11ac.patch)
sha256sums=('218a37d95f48b5e7cf285363d3ab16c314d97627a7a710cab3758902ae877f85'
            'SKIP'
            '628451adc1341abf0917da86dcae7922c42b6e61225ef4b55182e8dbe74cfa49')
validpgpkeys+=('1629C061B3DDE7EB4AE34B81021DB8B44E4A8645') # HandBrake Team <developers@handbrake.fr>

prepare() {
  cd "$srcdir/HandBrake-$pkgver"
  patch -Np1 -i ../handbrake-fix-close-button-in-about-dialog.patch
}

build() {
  cd "$srcdir/HandBrake-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-qsv
  make -C build
}

package_handbrake-no-qsv() {
  pkgdesc="Multithreaded video transcoder"
  depends=('desktop-file-utils' 'hicolor-icon-theme'
           "${_commondeps[@]}" "${_guideps[@]}")
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'intel-media-sdk: Intel QuickSync support'
              'libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/HandBrake-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-no-qsv-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  optdepends=('intel-media-sdk: Intel QuickSync support'
              'libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/HandBrake-$pkgver/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
