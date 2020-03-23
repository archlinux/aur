# Maintainer: b6b <b6bb at pm dot me>

pkgname=x264-tmod-git
_branch=t_mod_New
pkgver=159.r3044.gb09a90f3
pkgrel=2
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
source=(
  git+https://github.com/jpsdr/x264.git#branch="${_branch}"
  https://gist.githubusercontent.com/b6b/27246e5c217561465301dde13965d36a/raw/9147b91d4c5f2ba97c0289cff54349cae5134a48/fix-log-level-declaration.patch
)
sha256sums=(
  SKIP
  8d6717edfc3124b43b5aa4e8bfbd3e6f0dffbf1e945a280826d54303476d58ae
)

prepare() {
  cd x264

  git checkout -b "$_branch" # to build with correct X264_VERSION/X264_POINTER
  patch -i "${srcdir}"/fix-log-level-declaration.patch
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
