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
pkgver=1.10.2
pkgrel=1
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, nvdec, fdk-aac, qsv, vce, numa, hardened, libdovi"
arch=(x86_64)
url="https://handbrake.fr/"
license=(LicenseRef-Unredistributable)
source=("git+https://github.com/HandBrake/HandBrake.git#tag=${pkgver}")
_commondeps=(libass libvorbis opus speex libtheora lame libjpeg-turbo
             x264 libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk4 gdk-pixbuf2 pango libxml2 glib2)
_implicitdeps=(xz zlib glibc gcc-libs bzip2 libdrm)
makedepends=(git python nasm wget cmake meson llvm clang cargo-c
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for enabling Nvidia nvenc and nvdec'
            'cuda: for enabling Nvidia nvenc and nvdec'
            'amf-amdgpu-pro: for enabling AMD AMF')
sha256sums=('40bc16213cef6df27d524949089d3ccb6d1eea9e6fef8e35f14f5b15b167d521')
options=(!lto)

build() {
  # warning when build with -D_FORTIFY_SOURCE=3 (Arch Linux default)
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  cd "HandBrake"

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
  depends=("${_commondeps[@]}" "${_guideps[@]}" "${_implicitdeps[@]}")
  optdepends+=('gst-plugins-good: for video previews'
               'gst-libav: for video previews')
  provides=(handbrake)
  conflicts=(handbrake)

  cd "HandBrake"
  make DESTDIR="${pkgdir}" -C build install
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/usr/bin/HandBrakeCLI"
}

package_handbrake-full-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}" "${_implicitdeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "HandBrake"
  install -D build/HandBrakeCLI "${pkgdir}/usr/bin/HandBrakeCLI"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
