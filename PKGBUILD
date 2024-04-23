# Maintainer:

_pkgname="libsmallfry"
pkgname="$_pkgname-git"
pkgver=0.2.0.r2.gc31c6a4
pkgrel=3
pkgdesc='Smallfry metric for JPEG optimization'
url="https://github.com/ImageProcessing-ElectronicPublications/libsmallfry"
license=('ISC')
arch=('x86_64')

depends=('glibc')
makedepends=(
  'meson'
  'git'
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
  '6e0ac9091e7653fdf6490221a76d5331f8c4fd12d068b7fe1ad77a7af762637d'
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
