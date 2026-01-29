pkgname=pwasio-git
_ver=0.0.2 # repo does not have version tags
pkgver=0.0.2.r142.g4ec9878
pkgrel=1
pkgdesc="PipeWire ASIO driver for Wine"
url="https://github.com/golfiros/pwasio"
arch=('x86_64')
license=('GPL-3.0-or-later')
options=('!lto' '!debug')
depends=('pipewire' 'realtime-privileges' 'wine')
makedepends=('gcc' 'git' 'make')

install=pwasio.install

source=(
  "git+https://github.com/golfiros/pwasio.git"
  pwasio-install
)
sha256sums=(
  'SKIP'
  'd7cd82146cc55cb76ddda40e9e43d100cf7e844f072d96a88d56abb51de737e9'
)

pkgver() {
  cd pwasio
  set -x
  local ver
  ver=$(git describe --long --tags --abbrev=7 2>/dev/null || true)
  if [[ -n "$ver" ]]; then
    printf '%s\n' "${ver#v}" | sed 's/-/./g'
  else
    printf '%s.r%s.g%s\n' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd pwasio
  make
}

package() {
  cd pwasio
  install -D -m755 lib/wine/x86_64-unix/pwasio.dll.so "$pkgdir"/usr/lib/wine/x86_64-unix/pwasio.dll.so
  install -D -m644 lib/wine/x86_64-windows/pwasio.dll "$pkgdir"/usr/lib/wine/x86_64-windows/pwasio.dll
  install -D -m755 ../pwasio-install "$pkgdir"/usr/bin/pwasio-install
  install -D -m644 README.md "$pkgdir"/usr/share/"$pkgname"/README.md
}
# vim:set ts=2 sw=2 et:
