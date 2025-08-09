# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-dev-git
pkgname=(handbrake-dev-git handbrake-cli-dev-git)
pkgver=1.10.0.r0.gdba479e9f
pkgrel=1
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, nvdec, qsv, vce, numa, hardened, libdovi. Master branch"
arch=(i686 x86_64)
url="https://github.com/HandBrake/HandBrake"
license=(GPL-2.0-only)
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame libjpeg-turbo
             x264 libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk4 libgudev)
makedepends=(git intltool python nasm wget cmake meson llvm clang cargo-c
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for Nvidia users, enable Nvidia nvenc'
            'cuda: for Nvidia users, enable Nvidia nvdec'
            'amf-amdgpu-pro: for enabling AMD AMF')
options=(!lto)
source=("handbrake::git+https://github.com/HandBrake/HandBrake.git")
sha256sums=('SKIP')

pkgver() {
  cd handbrake
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # warning when build with -D_FORTIFY_SOURCE=3 (Arch Linux default)
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  cd handbrake

  ./configure \
    --prefix=/usr \
    --harden \
    --enable-x265 \
    --enable-numa \
    --enable-libdovi \
    --enable-nvenc \
    --enable-nvdec \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-dev-git() {
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

package_handbrake-cli-dev-git() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}" libjpeg-turbo)
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/handbrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
