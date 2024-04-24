# Maintainer:

_pkgname="jpeg-recompress"
pkgname="$_pkgname-git"
pkgver=2.6.4.r1.ge6ad714
pkgrel=3
pkgdesc='JPEG compression optimizer - IPEP fork (webp support and fixes)'
url="https://github.com/ImageProcessing-ElectronicPublications/jpeg-recompress"
license=('MIT')
arch=('x86_64')

depends=('libwebp')
makedepends=(
  'clang'
  'git'
  'meson'
  'mold'
)

provides=(
  "$_pkgname=${pkgver%%.r*}"
  "jpeg-archive=${pkgver%%.r*}"
)
conflicts=(
  "$_pkgname"
  "jpeg-archive"
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/ImageProcessing-ElectronicPublications/jpeg-recompress.git"
  "libiqa"::"git+https://github.com/ImageProcessing-ElectronicPublications/libiqa.git"
  "libsmallfry"::"git+https://github.com/ImageProcessing-ElectronicPublications/libsmallfry.git"
  "meson-submodules.patch"
  "smallfry-header.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '7a3163fbc6cd16c7b10219ce5a0cbb4059603f8e6cbc10a5bfa06603b7c1fa78'
  '8e42b2e802feaeec62999bbef85805020e2985b3818d69fe092cdbeec3de98ff'
)

prepare() {
  cd "$_pkgsrc"
  install -dm755 subprojects
  mv "$srcdir/libiqa" subprojects/
  mv "$srcdir/libsmallfry" subprojects/

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 --follow-symlinks -i "$srcdir/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CC LDFLAGS
  CC=clang
  LDFLAGS+=" -fuse-ld=mold"

  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
