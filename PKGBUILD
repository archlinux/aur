# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=ghfetch-rs-git
pkgver=0.1.0.r17.gff0bcfb
pkgrel=1
pkgdesc='GitHub stats in the terminal, neofetch-style (development snapshot)'
arch=('x86_64')
url='https://github.com/OneNoted/ghfetch'
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('git' 'rust')
provides=('ghfetch')
conflicts=('ghfetch' 'ghfetch-rs-bin')
_target='x86_64-unknown-linux-gnu'
source=('ghfetch::git+https://github.com/OneNoted/ghfetch.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ghfetch"

  local cargo_version
  local description
  description="$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null || true)"

  if [[ -n "${description}" ]]; then
    description="${description#v}"
    printf '%s\n' "${description}" | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
    return
  fi

  cargo_version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)"

  printf '%s.r%s.g%s\n' \
    "${cargo_version:-0.0.0}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/ghfetch"
  cargo fetch --locked --target "${_target}"
}

build() {
  cd "${srcdir}/ghfetch"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --target "${_target}"
}

package() {
  cd "${srcdir}/ghfetch"
  install -Dm755 "target/${_target}/release/ghfetch" "${pkgdir}/usr/bin/ghfetch"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
