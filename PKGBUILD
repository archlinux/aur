# Maintainer: b6b <b6bb at pm dot me>

pkgname=x264-tmod-git
_branch=t_mod_New
pkgver=159.r3046.g8f175b53
pkgrel=1
pkgdesc='Open Source H264/AVC video encoder (tmod git version)'
arch=(x86_64)
url=https://github.com/jpsdr/x264/tree/"${_branch}"
license=(GPL)
depends=(
  liblsmash.so
)
makedepends=(
  git
  l-smash-x264-tmod-git
  nasm
)
provides=(
  x264
  libx264
  libx264.so
)
replaces=(
  libx264
  libx264-10bit
  libx264-all
)
conflicts=(
  libx264
  libx264-10bit
  libx264-all
)
source=(git+https://github.com/jpsdr/x264.git#branch="${_branch}")
sha256sums=(SKIP)

prepare() {
  cd x264

  git checkout -b "$_branch" # to build with correct X264_VERSION/X264_POINTER
}

pkgver() {
  cd x264

  local _version
  local _revision
  local _shorthash

  _version="$(grep '#define X264_BUILD' x264.h | awk '{ print $3 }')"
  _revision="$(git rev-list --count HEAD)"
  _shorthash="$(git rev-parse --short HEAD)"

  printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
  cd x264

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --enable-pic \
    --enable-lto \
    --disable-avs \
    --disable-audio

  make
}

package() {
  make -C x264 DESTDIR="${pkgdir}" install-cli install-lib-shared
}
