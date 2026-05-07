# Maintainer: sandwichfarm <sandwich.farm@protonmail.com>

pkgname=nsyte
pkgver=0.27.0
pkgrel=1
pkgdesc="Publish your site to nostr and blossom servers"
arch=('x86_64')
url="https://github.com/sandwichfarm/nsyte"
license=('MIT')
makedepends=('deno')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4827db7f6697daee6f05329df5399bf35237a2ca1f047296e757fe031c927452')

_check_deno() {
  if ! command -v deno >/dev/null 2>&1; then
    cat >&2 <<'EOF'
ERROR: deno is required to build nsyte from source.

Install Deno on Arch Linux, then rerun makepkg:
  sudo pacman -S deno
  makepkg -si

You can also let makepkg resolve declared dependencies automatically:
  makepkg -si

If makepkg still reports a missing deno dependency, refresh package databases:
  sudo pacman -Syu deno
EOF
    return 1
  fi
}

prepare() {
  _check_deno
  deno --version
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _check_deno
  deno compile --no-check \
    --allow-run \
    --allow-read \
    --allow-write \
    --allow-net \
    --allow-env \
    --allow-sys \
    --target x86_64-unknown-linux-gnu \
    --output dist/nsyte \
    src/cli.ts
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "dist/nsyte" "${pkgdir}/usr/bin/nsyte"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
