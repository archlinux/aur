# Maintainer: Monjaris <ziyanovruzlu750@gmail.com>
pkgname=vexa-git
_pkgname=vexa
pkgver=r0
pkgrel=2
pkgdesc="Modern C++23 graphics/multimedia framework on top of SDL3"
arch=('x86_64' 'aarch64')
url="https://github.com/monjaris/vexa"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'xmake' 'cmake' 'ninja')
provides=('vexa')
conflicts=('vexa')
options=(!debug)
source=("git+https://github.com/monjaris/vexa.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Use latest tag if available, otherwise commit count
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "${_pkgname}"
  # Pin xmake package repositories/config if needed; allow xmake to resolve deps.
  :
}

build() {
  cd "${_pkgname}"
  xmake f -m release --lib=shared -y
  xmake -y -v
}

package() {
  cd "${_pkgname}"

  # Install library
  local lib
  lib="$(find . -type f -name 'libvexa.so*' ! -path '*/.deps/*' | sort | head -n1)"
  if [[ -z "$lib" ]]; then
    echo "error: libvexa shared library not found" >&2
    return 1
  fi
  install -Dm755 "$lib" "${pkgdir}/usr/lib/libvexa.so"

  # Install headers
  find include/vexa -type f -name '*.hpp' | while read -r hdr; do
    install -Dm644 "$hdr" "${pkgdir}/usr/${hdr}"
  done

  # License
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
