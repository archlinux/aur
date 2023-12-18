# Maintainer: Holger Obermaier <holgerob@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=(
  'handbrake-llvm-optimized'
  'handbrake-llvm-optimized-cli'
)

# Follow handbrakes most current stable branch 1.7.x
# https://github.com/HandBrake/HandBrake/commits/1.7.x
readonly _commit=9bb9dd7873362377118a6c0ae357e58d3802ccbf

pkgver() {
  git -C HandBrake/ gc --auto --prune=now
  git -C HandBrake/ describe ${_commit} | sed -e 's/^v//g' -e 's/-/.r/' -e 's/-/./'
}

pkgver=1.7.1.r19.g9bb9dd787
pkgrel=2
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL')
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
  'gtk3'
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
  'clang'
  'lld'
  'llvm'
  # AMD VCE encoding on Linux requires Vulkan
  'vulkan-headers'
  "${_commondeps[@]}"
  "${_guideps[@]}"
)
options=('!lto') # https://bugs.archlinux.org/task/72600
source=("HandBrake::git+https://github.com/HandBrake/HandBrake.git#tag=${_commit}")
sha256sums=('SKIP')

prepare() {
    patch --directory=HandBrake --strip 1 <<-'EOF'
--- a/contrib/svt-av1/module.defs
+++ b/contrib/svt-av1/module.defs
@@ -3,9 +3,9 @@ __deps__ :=
 $(eval $(call import.MODULE.defs,SVT-AV1,svt-av1,$(__deps__)))
 $(eval $(call import.CONTRIB.defs,SVT-AV1))
 
-SVT-AV1.FETCH.url     = https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/SVT-AV1-v1.7.0.tar.gz
-SVT-AV1.FETCH.url    += https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.7.0/SVT-AV1-v1.7.0.tar.gz
-SVT-AV1.FETCH.sha256  = ce0973584f1a187aa4abf63f509ff8464397120878e322a3153f87e9c161fc4f
+SVT-AV1.FETCH.url     = https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/SVT-AV1-v1.8.0.tar.gz
+SVT-AV1.FETCH.url    += https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.8.0/SVT-AV1-v1.8.0.tar.gz
+SVT-AV1.FETCH.sha256  = 5be046efd5d5a5012e919249ee9e5791c9957f79f9d006d697882f02ad014f56
 
 SVT-AV1.build_dir             = build
 SVT-AV1.CONFIGURE.exe         = cmake
EOF
    rm -v HandBrake/contrib/svt-av1/A00-Revert-pkg-config-Use-Libs.private-in-pkg-config-fil.patch
    rm -v HandBrake/contrib/svt-av1/A01-adds-neon-sse2neon-implementations-of-SVT-AV1_v15.patch
}

setup_compiler() {
  export CC="/usr/bin/clang"
  unset CFLAGS
  export CXX="/usr/bin/clang++"
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
    --optimize=speed
    --cpu=native
    --lto=on
    --enable-qsv
    --enable-vce
  )

  cd "${srcdir}/HandBrake" || exit
  ./configure "${CONFIGURE_OPTIONS[@]}"
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
    --directory="${srcdir}/HandBrake/build" \
    DESTDIR="${pkgdir}" \
    install
  rm "${pkgdir}/usr/bin/HandBrakeCLI"
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

  install -D "${srcdir}/HandBrake/build/HandBrakeCLI" "${pkgdir}/usr/bin/HandBrakeCLI"
}
