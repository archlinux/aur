# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>

pkgname=x262-git
pkgver=0.142.2631+93.9679f15
pkgrel=1
pkgdesc="x264 with MPEG-2 video support (GIT version)"
arch=('x86_64')
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'zlib' 'libz.so'
  'bzip2' 'libbz2.so'
  'xz' 'liblzma.so'
  'sdl12-compat' # libSDL-1.2.so
  'libx11' # libX11.so
  'libxcb' # libxcb-shape.so libxcb-shm.so libxcb-xfixes.so libxcb.so 
)
makedepends=(
  'git'
  'yasm'
)
url="https://www.videolan.org/developers/x262.html"
source=(
  'git+https://github.com/kierank/x262.git#branch=obe'
  'git+https://github.com/ffmpeg/ffmpeg.git#tag=n2.8.22'
  'git+https://github.com/FFMS/ffms2.git#tag=2.21'
  'mathops_fix.patch'
)
provides=('x262')
conflicts=('x262')
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'a50d7da9870a3fd801ad3a4d13d5c9b260acb094cf8bfa4afd95a54741173a7f'
)
options=('debug' '!lto')

pkgver() {
  cd x262
  echo "$(sh version.sh | grep 'X264_POINTVER' | cut -d '"' -f2 | tr M m | tr ' ' .)"
}

prepare() {
  mkdir -p build-{ffmpeg,ffms2}

  patch -d ffmpeg -p1 -i "${srcdir}/mathops_fix.patch"
}

build() {

  msg2 "Build FFmpeg"
  cd "${srcdir}/build-ffmpeg"
  ../ffmpeg/configure \
    --prefix="${srcdir}/fakeroot" \
    --disable-{network,{encod,mux}ers,hwaccels,{in,out}devs,debug,doc,vdpau,vaapi,programs} \
    --enable-pic \
    --enable-gpl \
    --disable-decoder=opus

  make install-libs install-headers

  export PKG_CONFIG_LIBDIR="${srcdir}/fakeroot/lib/pkgconfig"
  export PKG_CONFIG_PATH="${PKG_CONFIG_LIBDIR}:/usr/lib/pkgconfig"

  msg2 "Build FFmpegsource"
  cd "${srcdir}/build-ffms2"
  (
    cd "${srcdir}/ffms2"
    mkdir -p src/config
    autoreconf -vfi
  )
  ../ffms2/configure \
    --prefix="${srcdir}/fakeroot" \
    --enable-shared=no

  make install-libLTLIBRARIES install-pkgconfigDATA install-includeHEADERS

  msg2 "Build x262"
  cd "${srcdir}/x262"
  ./configure \
    --prefix=/usr \
    --disable-lsmash \
    --enable-pic

  make
}

package() {
  make -C x262 DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin/x262"
  mv "${pkgdir}/usr/bin/x264" "${pkgdir}/usr/bin/x262"
}
