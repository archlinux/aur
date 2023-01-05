# Maintainer: Holger Obermaier <holgerob@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=(
  'handbrake-llvm-optimized'
  'handbrake-llvm-optimized-cli'
)

_commit=788aa707cc4facca0e5df281a5d9aae153b2bf7d
pkgver() {
  git -C HandBrake/ fetch --prune --prune-tags
  git -C HandBrake/ gc --auto --prune=now
  git -C HandBrake/ describe ${_commit} | sed -e 's/^v//g' -e 's/-/.r/' -e 's/-/./'
}

pkgver=1.6.0.r10.g788aa707c
pkgrel=1
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL')
_commondeps=(
  'libxml2'
  'libass'
  'libvorbis'
  'opus'
  'speex'
  'libtheora'
  'lame'
  'x264'
  'jansson'
  'libvpx'
  'libva'
  'numactl'
  'bzip2'
  'gcc-libs'
  'zlib'
  'xz'
  'libjpeg-turbo'
)
_guideps=(
  'gst-plugins-base'
  'gtk3'
  'librsvg'
  'libgudev'
)
makedepends=(
  'intltool'
  'python'
  'nasm'
  'wget'
  'cmake'
  'meson'
  'git'
  'clang'
  'lld'
  'llvm'
  "${_commondeps[@]}"
  "${_guideps[@]}"
)
options=('!lto') # https://bugs.archlinux.org/task/72600
source=("HandBrake::git+https://github.com/HandBrake/HandBrake.git#tag=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/HandBrake"
}

build() {
  unset CFLAGS CXXFLAGS LDFLAGS
  export CC="/usr/bin/clang"
  export CXX="/usr/bin/clang++"
  export CPP="/usr/bin/clang-cpp"
  export LD="/usr/bin/lld"
  export AR="/usr/bin/llvm-ar"
  export RANLIB="/usr/bin/llvm-ranlib"
  export NM="/usr/bin/llvm-nm"
  export ADDR2LINE="/usr/bin/llvm-addr2line"
  export OBJCOPY="/usr/bin/llvm-objcopy"
  export OBJDUMP="/usr/bin/llvm-objdump"
  export READELF="/usr/bin/llvm-readelf"
  export STRIP="/usr/bin/llvm-strip"

  export LDFLAGS="-fuse-ld=lld"

  cd "$srcdir/HandBrake"
  ./configure \
    --launch-jobs=0 \
    --prefix=/usr \
    --cc="${CC}" \
    --ar="${AR}" \
    --ranlib="${RANLIB}" \
    --strip="${STRIP}" \
    --optimize=speed \
    --cpu=native \
    --lto=on \
    --enable-qsv \
    --enable-vce
  make -C build
}

package_handbrake-llvm-optimized() {
  pkgdesc="Multithreaded video transcoder optimized with LLVM"
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
    'libdvdcss: for decoding encrypted DVDs'
  )
  provides=(handbrake)
  conflicts=(handbrake)

  make \
    --directory="$srcdir/HandBrake/build" \
    DESTDIR="$pkgdir" \
    install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-llvm-optimized-cli() {
  pkgdesc="Multithreaded video transcoder optimized with LLVM (CLI)"
  depends=("${_commondeps[@]}")
  optdepends=(
    'intel-media-sdk: Intel QuickSync support'
    'libdvdcss: for decoding encrypted DVDs'
  )
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  install -D "$srcdir/HandBrake/build/HandBrakeCLI" "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
