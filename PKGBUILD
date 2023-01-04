# Maintainer: Alan Beale <the.mrabz@gmail.com>

pkgname=('handbrake-nvenc' 'handbrake-nvenc-cli')
pkgver=1.6.0
pkgrel=2
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL')
_commondeps=('libxml2' 'libass' 'libvorbis' 'opus' 'speex' 'libtheora' 'lame'
             'x264' 'jansson' 'libvpx' 'libva' 'numactl'
             'bzip2' 'gcc-libs' 'zlib' 'xz')
_guideps=('gst-plugins-base' 'gtk3' 'librsvg' 'libgudev')
makedepends=('intltool' 'python' 'nasm' 'wget' 'cmake' 'meson'
             "${_commondeps[@]}" "${_guideps[@]}")
options=('!lto') # https://bugs.archlinux.org/task/72600
source=(https://github.com/HandBrake/HandBrake/releases/download/$pkgver/HandBrake-$pkgver-source.tar.bz2{,.sig}
        fix-build-with-Werror-format-security.patch)
sha256sums=('7f23c76038b7bf329089d0eb33c14898400fcc0426e310e87dc11e538c103cda'
            'SKIP'
            '9e46ab5c9539bd0910780f38131097c4e3871acde70c89a92abfc8edc9ec2c21')
validpgpkeys+=('1629C061B3DDE7EB4AE34B81021DB8B44E4A8645') # HandBrake Team <developers@handbrake.fr>
conflicts=('handbrake')

prepare() {
  cd HandBrake-$pkgver
  # https://github.com/HandBrake/HandBrake/pull/4761
  patch -Np1 -i ../fix-build-with-Werror-format-security.patch
}

build() {
  cd HandBrake-$pkgver

  ./configure \
    --prefix=/usr\
    --enable-nvenc
  make -C build
}

package_handbrake-nvenc() {
  pkgdesc="Multithreaded video transcoder with NVEnc Support"
  depends=('desktop-file-utils' 'hicolor-icon-theme'
           "${_commondeps[@]}" "${_guideps[@]}")
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/HandBrake-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-nvenc-cli() {
  pkgdesc="Multithreaded video transcoder (CLI) with NVEnc Support"
  depends=("${_commondeps[@]}")
  optdepends=('libdvdcss: for decoding encrypted DVDs')

  cd HandBrake-$pkgver/build
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
