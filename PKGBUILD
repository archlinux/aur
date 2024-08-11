# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-full
pkgname=(handbrake-full handbrake-full-cli)
pkgver=1.8.2
pkgrel=1
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, fdk-aac, qsv, vce, numa, hardened"
arch=(x86_64 i686)
url="https://handbrake.fr/"
license=(GPL-2.0-only)
source=("handbrake::git+https://github.com/HandBrake/HandBrake.git#tag=${pkgver}")
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame libjpeg-turbo
             x264 libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk4 librsvg libgudev)
makedepends=(git intltool python nasm wget cmake meson llvm clang cargo-c
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for enabling Nvidia nvenc and nvdec'
            'cuda: for enabling Nvidia nvenc and nvdec'
            'amf-amdgpu-pro: for enabling AMD AMF')
sha256sums=('e2f31934d4fffc130a42998fd7d7a206e30f9884ee957fe20370ae07a13683c8')
options=(!lto)

 build() {
  cd "handbrake"

  ./configure \
    --prefix=/usr \
    --harden \
    --enable-x265 \
    --enable-numa \
    --enable-libdovi \
    --enable-fdk-aac \
    --enable-nvenc \
    --enable-nvdec \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-full() {
  pkgdesc="Multithreaded video transcoder"
  depends=("${_commondeps[@]}" "${_guideps[@]}")
  optdepends+=('gst-plugins-good: for video previews'
              'gst-libav: for video previews')
  provides=(handbrake)
  conflicts=(handbrake)

  cd "$srcdir/handbrake/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-full-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/handbrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
