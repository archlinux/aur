# Maintainer: David Scott <david@davidallanscott.ca>
#
# "-bin" package wrapping the official .deb produced by this repo's own
# GitHub Release (tauri-action's build job) — the standard AUR pattern for
# packages that wrap an upstream project's own official prebuilt artifact
# rather than rebuilding from source on the user's machine.
#
# Package name is telemetry-admin (matches the GitHub repo name), not
# typiql — "typiql" is the underlying library this app is built on top of,
# not the app's own name; the installed binary is still `typiql` on PATH
# (see provides/conflicts below), just the AUR package identity itself is
# telemetry-admin.
#
# Release asset naming/tag format confirmed against a real GitHub Release
# (telemetry-admin-v0.1.1): release-please tags as
# {package-name}-v{version}, and tauri-action's default .deb name is
# `<productName>_<version>_<arch>.deb` (productName="typiql" per
# src-tauri/tauri.conf.json). sha256sums is `SKIP` until a real checksum
# is filled in via `updpkgsums` before pushing to the real AUR — `SKIP` is
# fine for the CI validation build in .github/workflows/integration-test.yml,
# which only needs the package to build+install successfully, not to prove
# supply-chain integrity.

pkgname=telemetry-admin
pkgver=0.1.1
pkgrel=1
pkgdesc="Telemetry dashboard designer and recorder for sim racing rigs (typiql)"
arch=('x86_64')
url="https://github.com/MrDavid5465/telemetry-admin"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('typiql')
conflicts=('typiql')
options=('!strip')
source=("https://github.com/MrDavid5465/telemetry-admin/releases/download/telemetry-admin-v${pkgver}/typiql_${pkgver}_amd64.deb")
sha256sums=('b114d0d4c9436560d48eb741c97aa82e0c6b909e97349e021e827afeafcc2819')

package() {
  cd "$srcdir"
  bsdtar -xOf "typiql_${pkgver}_amd64.deb" data.tar.* | bsdtar -xf - -C "$pkgdir"
}
