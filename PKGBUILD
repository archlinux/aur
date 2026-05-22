# Maintainer: Gray Espinoza <grey at grayespinoza dot dev>
# Contributor: Holger Obermaier <holgerob at gmx dot de>
# Contributor: Evangelos Foutras <evangelos at foutrelis dot com>
# Contributor: Giovanni Scafora <giovanni at archlinux dot org>
# Contributor: Sebastien Piccand <sebcactus at gmail dot com>

pkgname=(
  'handbrake-svt-av1-hdr'
  'handbrake-svt-av1-hdr-cli'
)
pkgver=1.11.1.r9.g4f0f5feed
pkgrel=1
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL-2.0-or-later')
_commondeps=(
  'bzip2'
  'fribidi'
  'gcc-libs'
  'jansson'
  'lame'
  'libass'
  'libjpeg-turbo'
  'libogg'
  'libtheora'
  'libva'
  'libvorbis'
  'libvpx'
  'libxml2'
  'numactl'
  'opus'
  'speex'
  'x264'
  'xz'
  'zlib'
)
_guideps=(
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk4'
  'harfbuzz'
  'libgudev'
  'pango'
)
makedepends=(
  'base-devel'
  'intltool'
  'python'
  'nasm'
  'wget'
  'cmake'
  'meson'
  'git'
  'clang>=20'
  'lld'
  'llvm'
  'rust'
  'cargo-c'
  'ffnvcodec-headers'
  # AMD VCE encoding on Linux requires Vulkan
  'vulkan-headers'
  "${_commondeps[@]}"
  "${_guideps[@]}"
)
options=('!lto') # https://bugs.archlinux.org/task/72600
source=("HandBrake::git+https://github.com/HandBrake/HandBrake.git#commit=4f0f5feed" "HandBrake-SVT-AV1-HDR::git+https://github.com/grayespinoza/handbrake-svt-av1-hdr.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "${srcdir}"
  for filename in HandBrake-SVT-AV1-HDR/patches/*.patch; do
    echo "Applying $(basename "$filename")"
    patch -t -N -p1 -d HandBrake <"$filename"
  done
}

setup_compiler() {
  export CC=clang
  unset CFLAGS
  export CXX=clang++
  unset CXXFLAGS
  export CPP="/usr/bin/clang-cpp"
  export LD="/usr/bin/lld"
  export LDFLAGS="-fuse-ld=lld"
  export AR="/usr/bin/llvm-ar"
  export RANLIB="/usr/bin/llvm-ranlib"
  export NM="/usr/bin/llvm-nm"
  export ADDR2LINE="/usr/bin/llvm-addr2line"
  export OBJCOPY="/usr/bin/llvm-objcopy"
  export OBJDUMP="/usr/bin/llvm-objdump"
  export READELF="/usr/bin/llvm-readelf"
  export STRIP="/usr/bin/llvm-strip"
}

build() {
  setup_compiler

  local -a CONFIGURE_OPTIONS=(
    --launch-jobs=0
    --prefix=/usr
    --cc="${CC}"
    --ar="${AR}"
    --ranlib="${RANLIB}"
    --strip="${STRIP}"
    --lto=on
    --enable-qsv
    --enable-vce
    --enable-nvenc
    --enable-libdovi
  )

  cd "${srcdir}/HandBrake" || exit
  ./configure "${CONFIGURE_OPTIONS[@]}"
  make -C build
}

package_handbrake-svt-av1-hdr() {
  pkgdesc="Multithreaded video transcoder supporting SVT-AV1-HDR"
  depends=(
    'desktop-file-utils'
    'hicolor-icon-theme'
    "${_commondeps[@]}"
    "${_guideps[@]}"
  )
  optdepends=(
    'gst-plugins-good: for video previews'
    'gst-libav: for video previews'
    'intel-media-sdk: Intel QuickSync support'
    'nvidia-utils: NVIDIA NVENC support'
    'libdvdcss: for decoding encrypted DVDs'
  )
  provides=(handbrake)
  conflicts=(handbrake)

  make \
    --directory="${srcdir}/HandBrake/build" \
    DESTDIR="${pkgdir}" \
    install
  rm "${pkgdir}/usr/bin/HandBrakeCLI"
}

package_handbrake-svt-av1-hdr-cli() {
  pkgdesc="Multithreaded video transcoder supporting SVT-AV1-HDR (CLI)"
  depends=("${_commondeps[@]}")
  optdepends=(
    'intel-media-sdk: Intel QuickSync support'
    'nvidia-utils: NVIDIA NVENC support'
    'libdvdcss: for decoding encrypted DVDs'
  )
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  install -D "${srcdir}/HandBrake/build/HandBrakeCLI" "${pkgdir}/usr/bin/HandBrakeCLI"
}
