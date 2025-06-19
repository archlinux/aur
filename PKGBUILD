# Maintainer:
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgname="cpptoml"
pkgname="$_pkgname"
pkgver=0.1.1
pkgrel=4
pkgdesc="A header-only library for parsing TOML"
url="https://github.com/skystrife/cpptoml"
license=('MIT')
arch=('any')

makedepends=(
  'cmake'
  'ninja'
)

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver/$_pkgname-v$pkgver.$_pkgext"
  '0001-PR123-limit_header.patch'
  '0002-PR124-pkgconfig.patch'
)
sha256sums=(
  '23af72468cfd4040984d46a0dd2a609538579c78ddc429d6b8fd7a10a6e24403'
  '889c4307ed34f9089ec5f56f5ffb53ae4730047ada8be013d21cd52f11575287'
  '4b9564ae21db82ad26666cf9b0c72fdd7f064ba8593ed1e6c3755608fa7dc4ac'
)

prepare() {
  cd "$_pkgsrc"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\n\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$_pkgsrc/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
