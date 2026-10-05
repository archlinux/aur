# Maintainer: Carsten Schlote <schlote@vahanus.net>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-full-va-api
pkgname=(handbrake-full-va-api handbrake-full-va-api-cli)
pkgver=1.11.2.r20261002.g174246f
pkgrel=1
pkgdesc="HandBrake snapshot with VA-API encoding enabled"
arch=(x86_64)
url="https://handbrake.fr/"
license=(LicenseRef-Unredistributable)
_commondeps=(libass libvorbis opus speex libtheora lame libjpeg-turbo
             x264 libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk4 gdk-pixbuf2 pango libxml2 glib2)
_implicitdeps=(xz zlib glibc gcc-libs bzip2 libdrm)
makedepends=(git python nasm wget cmake meson llvm clang cargo-c
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for enabling Nvidia NVENC and NVDEC'
            'cuda: for enabling Nvidia NVENC and NVDEC'
            'libva-mesa-driver: VA-API backend for AMD/Mesa GPUs'
            'gst-plugins-good: for video previews'
            'gst-libav: for video previews')
source=("HandBrake::git+https://github.com/HandBrake/HandBrake.git#commit=174246fbee3150206c43943915301cca22981d32"
        'vaapi-gui-libs.patch')
sha256sums=('SKIP'
            'cc328eba1394b87355d2d13794545fc5525ffb869b61cf83f8ca7c9817a3f6bd')
options=(!lto)

prepare() {
  cd "$srcdir/HandBrake"
  patch -Np1 -i "$srcdir/vaapi-gui-libs.patch"
}

build() {
  export CFLAGS="${CFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/D_FORTIFY_SOURCE=3/D_FORTIFY_SOURCE=2}"

  cd "$srcdir/HandBrake"

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
    --enable-vaapi \
    --disable-vce

  make -C build
}

package_handbrake-full-va-api() {
  pkgdesc="Multithreaded video transcoder with VA-API enabled"
  depends=("${_commondeps[@]}" "${_guideps[@]}" "${_implicitdeps[@]}")
  provides=(handbrake)
  conflicts=(handbrake handbrake-full)

  cd "$srcdir/HandBrake"
  make DESTDIR="$pkgdir" -C build install
  strip "$pkgdir/usr/bin/ghb"
  install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-full-va-api-cli() {
  pkgdesc="Multithreaded video transcoder CLI with VA-API enabled"
  depends=("${_commondeps[@]}" "${_implicitdeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli handbrake-full-cli)

  cd "$srcdir/HandBrake"
  install -D build/HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
  install -D LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
