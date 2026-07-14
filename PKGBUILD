# Maintainer: Rodrigo Brito <rodrigo@w3ti.com.br>
#
# AUR-oriented PKGBUILD for the `lyra-vega` package base. It builds the
# tagged Vega release, but can be pointed at another checkout/source via
# VEGA_SOURCE_URL and VEGA_SOURCE_DIR for local builds.

pkgname=lyra-vega
pkgver=1.8.1
pkgrel=1
pkgdesc="Centro de controle para Linux"
arch=('x86_64')
url="https://github.com/britors/Vega"
license=('GPL-3.0-only')
depends=('electron43-bin' 'vegad')
optdepends=(
  'flatpak: origem Flathub para o módulo Software'
  'restic: motor do módulo Backup'
)
provides=('vega' 'lyrae')
conflicts=('vega' 'lyrae')
makedepends=('npm')
_source_url_default="git+https://github.com/britors/Vega.git#tag=v${pkgver}"
source=("Vega::${VEGA_SOURCE_URL:-${_source_url_default}}")
sha256sums=('SKIP')

build() {
  local _srcroot="${VEGA_SOURCE_DIR:-$srcdir/Vega}"
  cd "$_srcroot/vega"
  npm ci
  npm run build
  npm prune --omit=dev
}

package() {
  local _srcroot="${VEGA_SOURCE_DIR:-$srcdir/Vega}"
  cd "$_srcroot"

  install -dm755 "$pkgdir/usr/lib/lyra-vega"
  cp -r vega/out/* "$pkgdir/usr/lib/lyra-vega/"
  cp -r vega/node_modules "$pkgdir/usr/lib/lyra-vega/node_modules"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/vega" <<'WRAPPER'
#!/bin/sh
exec electron43 /usr/lib/lyra-vega/main/index.js "$@"
WRAPPER

  install -Dm644 packaging/vega/vega.desktop \
    "$pkgdir/usr/share/applications/vega.desktop"
  install -Dm644 packaging/vega/vega.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/vega.svg"

}
