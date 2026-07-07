# Maintainer: Lyra OS <team@lyraos.org>
#
# AUR-oriented PKGBUILD for the `lyra-vega` package base. It defaults to the
# tagged Vega source, but can be pointed at another checkout/source via
# VEGA_SOURCE_URL and VEGA_SOURCE_DIR.

pkgname=lyra-vega
pkgver=0.0
pkgrel=1
pkgdesc="Centro de controle do Lyra OS"
arch=('x86_64')
url="https://github.com/britors/Vega"
license=('GPL-3.0-only')
depends=('electron31-bin' 'vegad')
optdepends=(
  'flatpak: origem Flathub para o módulo Software'
  'restic: motor do módulo Backup'
)
provides=('vega' 'lyrae')
conflicts=('vega' 'lyrae')
makedepends=('npm')
_source_url_default="git+https://github.com/britors/Vega.git#branch=main"
source=("Vega::${VEGA_SOURCE_URL:-${_source_url_default}}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Vega"
  local count hash tag
  count="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"
  tag="$(git describe --tags --abbrev=0 2>/dev/null || true)"
  if [[ -n "$tag" ]]; then
    printf '%s.r%s.g%s' "${tag#v}" "$count" "$hash"
  else
    printf '0.0.r%s.g%s' "$count" "$hash"
  fi
}

build() {
  local _srcroot="${VEGA_SOURCE_DIR:-$srcdir/Vega}"
  cd "$_srcroot/vega"
  npm ci
  npm run build
}

package() {
  local _srcroot="${VEGA_SOURCE_DIR:-$srcdir/Vega}"
  cd "$_srcroot"

  install -dm755 "$pkgdir/usr/lib/lyra-vega"
  cp -r vega/out/* "$pkgdir/usr/lib/lyra-vega/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/vega" <<'WRAPPER'
#!/bin/sh
exec electron31 /usr/lib/lyra-vega/main/index.js "$@"
WRAPPER

  install -Dm644 packaging/vega/vega.desktop \
    "$pkgdir/usr/share/applications/vega.desktop"
  install -Dm644 packaging/vega/vega.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/vega.svg"

}
