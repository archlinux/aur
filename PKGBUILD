# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake-fdkaac' 'handbrake-cli-fdkaac')
pkgver=1.3.3
pkgrel=1
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL')
_commondeps=('libxml2' 'libass' 'libvorbis' 'opus' 'speex' 'libtheora' 'lame'
             'x264' 'jansson' 'libvpx' 'libva' 'numactl' 'bzip2' 'gcc-libs'
             'zlib' 'xz')
_guideps=('gst-plugins-base' 'gtk3' 'librsvg' 'libgudev')
makedepends=('intltool' 'python' 'nasm' 'wget' 'cmake' 'meson'
             "${_commondeps[@]}" "${_guideps[@]}")
source=(https://github.com/HandBrake/HandBrake/releases/download/$pkgver/HandBrake-$pkgver-source.tar.bz2
        handbrake-fix-close-button-in-about-dialog.patch::https://github.com/HandBrake/HandBrake/commit/d3eb4a11ac.patch)
sha256sums=('218a37d95f48b5e7cf285363d3ab16c314d97627a7a710cab3758902ae877f85'
            'd4ec5689a3ff6bb1d350ffc63199199ad45d90178a318070faed8a869fe5639b')

prepare() {
  cd "$srcdir/HandBrake-$pkgver"
  patch -Np1 -i ../handbrake-fix-close-button-in-about-dialog.patch
}

build() {
  cd "$srcdir/HandBrake-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-qsv \
    --enable-fdk
  make -C build
}

package_handbrake-fdkaac() {
  pkgdesc="Multithreaded video transcoder"
  conflicts=('handbrake')
  depends=('desktop-file-utils' 'hicolor-icon-theme'
           "${_commondeps[@]}" "${_guideps[@]}")
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/HandBrake-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-fdkaac() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  conflicts=('handbrake-cli')
  depends=("${_commondeps[@]}")
  optdepends=('libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/HandBrake-$pkgver/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
