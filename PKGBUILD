# Maintainer: William Horvath <william at horvath dot blog>

# Contributor: Alexandre Demers <alexandre.f.demers at gmail dot com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru at archlinux dot org>
# Contributor: Tom Newsom <Jeepster at gmx dot co dot uk>
# Contributor: Paul Mattal <paul at archlinux dot org>

pkgname="lib32-ffmpeg-minimal-dev"
pkgver=7.1
pkgrel=2
pkgdesc="A minimal set of lib32 headers and development libraries for ffmpeg"
arch=('x86_64')
url="https://ffmpeg.org"
license=('GPL-3.0-only')
makedepends=(
  'git'
  'lib32-gcc-libs'
)
options=(
  '!lto'
  '!debug'
  '!staticlibs'
  'strip'
)
source=(
  "git+https://github.com/FFmpeg/FFmpeg.git#tag=n${pkgver}"
)
b2sums=('c7ec6b1db61608195117b79f3f0c8f6323c3abeb39721359da0f10e7d739da8301e04ff5fa83c022f86fc760f66e00066f9a50d97b771f797ccc679f9d912c40')

build() {
  export CFLAGS="${CFLAGS} -Wno-error=incompatible-pointer-types -Wno-error=int-conversion -m32"
  export CXXFLAGS="${CXXFLAGS} -Wno-error=incompatible-pointer-types -Wno-error=int-conversion -m32"
  export LDFLAGS="${LDFLAGS} -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd FFmpeg

  ./configure \
    --prefix="/usr" \
    --libdir="/usr/lib32/ffmpeg-minimal-dev" \
    --shlibdir="/usr/lib32/ffmpeg-minimal-dev" \
    --incdir="/usr/include/${pkgname}" \
    --enable-shared \
    --disable-static \
    --disable-doc \
    --disable-programs \
    --disable-encoders \
    --disable-muxers \
    --disable-filters \
    --enable-gpl \
    --enable-version3 \
    --disable-debug \
    --disable-nonfree \
    --disable-hwaccels \
    --arch=x86_32 \
    --target-os=linux \
    --cross-prefix= \
    --disable-asm

  # unconfigured makepkg.conf doesn't necessarily mean the user wants the compilation to take hours...
  if [ -z "${MAKEFLAGS}" ]; then
    make -j$(($(nproc) + 1))
  else
    make
  fi
}

package() {
  make DESTDIR="${pkgdir}" -C FFmpeg install

  rm -r "${pkgdir}/usr/share"
}
