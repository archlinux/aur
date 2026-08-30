# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

_pkgname=Sable
pkgname="${_pkgname/S/s}"
pkgver=1.21.0
pkgrel=2
pkgdesc="An almost stable Matrix client"
arch=('x86_64')
url="https://github.com/SableClient/${_pkgname}"
license=('AGPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo-tauri' 'pnpm' 'rust')
options=('!lto') # Causes undefined ring_core_* symbol errors
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ba27303e62a89e283d47cef9171188fe0e0b57fdabc5b55fea085d1c13491a59')

prepare() {
   cd "${_pkgname}-${pkgver}"

   # HACK: Disable unnecessary postinstall script
   sed -i 's@node scripts/install-knope.js@true@' package.json

   # Fix Sable version in Cargo.lock (TODO: Remove this in the next version)
   sed -i "s@1\.20\.0@${pkgver}@" src-tauri/Cargo.lock
}

build() {
   cd "${_pkgname}-${pkgver}"

   pnpm install --frozen-lockfile

   # Increase V8 heap size to 4 GB (prevents potential JS OOMs when building)
   export NODE_OPTIONS="--max-old-space-size=4096"

   cargo-tauri build --bundles deb --no-sign -- --locked --features wry --no-default-features
}

package() {
   cd "${_pkgname}-${pkgver}"

   cp -a src-tauri/target/release/bundle/deb/"${_pkgname}"_"${pkgver}"_*/data/* "${pkgdir}"
}

# vim: ts=3 sw=3 et:
