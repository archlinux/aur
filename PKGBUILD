# Maintainer:

_pkgname="libiqa"
pkgname="$_pkgname-git"
pkgver=1.1.3.r2.g4687a4c
pkgrel=3
pkgdesc='Fast, accurate, and reliable C library for image quality assessment'
url="https://github.com/ImageProcessing-ElectronicPublications/libiqa"
license=('BSD-3-Clause')
arch=('x86_64')

depends=('glibc')
makedepends=(
  'git'
  'meson'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "meson.patch"
)
sha256sums=(
  'SKIP'
  'f747959b9495bc8403ea5b5c6e7894c5799219f98d2be506462ca9a95e6ef68b'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "$srcdir/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
