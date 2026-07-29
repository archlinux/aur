# Maintainer: Charims <charims at pcwideopen dot com>

pkgname=nikau-git
_pkgname=nikau
pkgver=r0.g3847fd4
pkgrel=1
pkgdesc="Linux network KVM for Wayland/X11/Console (git version)"
arch=('x86_64' 'aarch64')
url="https://nikau.nickbp.com/"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://git.sr.ht/~nickbp/nikau")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  local desc
  desc="$(git describe --long --tags 2>/dev/null)" || desc=""
  if [ -n "$desc" ]; then
    echo "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r0.g%s" "$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
  fi
}

build() {
  cd "$srcdir/${_pkgname}"
  export CFLAGS="${CFLAGS/-flto=auto/}"
  cargo build --release
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENCE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
