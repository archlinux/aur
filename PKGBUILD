# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

_pkgname=sable-next
pkgname=sable
pkgver=26.11.2
pkgrel=1
pkgdesc="An almost stable Matrix client"
arch=('x86_64')
url="https://sable.moe/"
license=('AGPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo-tauri' 'pnpm' 'rust')
options=('!lto') # Causes undefined ring_core_* symbol errors
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/SableClient/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ecf9e46546cb401d3397e50a28ac6f8e0ad84fde0f8995af0dacdd8d33968eab')

build() {
   cd "${_pkgname}-${pkgver}"

   pnpm install --frozen-lockfile

   # Increase V8 heap size to 4 GB as set in Mise config (prevents JS OOMs when building)
   export NODE_OPTIONS="--max-old-space-size=4096"

   cargo-tauri build --bundles deb --no-sign -- --locked --features wry --no-default-features
}

package() {
   cd "${_pkgname}-${pkgver}"

   cp -a src-tauri/target/release/bundle/deb/"${pkgname/s/S}"_"${pkgver}"_*/data/* "${pkgdir}"
}

# vim: ts=3 sw=3 et:
