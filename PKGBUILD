# Maintainer: teejer <teejer@users.noreply.github.com>
# Fork build based on upstream v1.10.0 carrying one not-yet-upstream patch:
#   - Per-tab AI panel: the uniTerm AI conversation is tied to the active
#     terminal tab instead of being global (upstream PR #1091).
# The previous fork patches (AI thinking stream #1084, Wayland desktop-file
# app_id #1085) shipped in upstream v1.10.0 and are no longer carried here.
# Built by GitHub Actions from https://github.com/Teejer/uniterm (tag
# v1.10.0.pertab.1). Once PR #1091 ships in an official upstream release,
# retire this package and use uniterm-bin instead.

pkgname=uniterm-fork-bin
pkgver=1.10.0.pertab.1
pkgrel=1
pkgdesc="Lightweight all-in-one terminal with 30+ protocols and a built-in autonomous AI agent (fork build: per-tab AI panel)"
arch=('x86_64' 'aarch64')
url="https://uniterm.net"
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('uniterm')
conflicts=('uniterm' 'uniterm-bin' 'uniterm-git')
options=('!strip' '!debug')

_gh="https://github.com/Teejer/uniterm/releases/download/v${pkgver}"

source_x86_64=(
  "${_gh}/uniterm-linux-amd64-v${pkgver}.deb"
  "LICENSE::https://raw.githubusercontent.com/Teejer/uniterm/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  '1ee3c4dcd79d8685d7f71ef95a5407bdf41f3bec2b52c2d711a78e6c9afc073e'
  '80b7ddff03e2b4535e40a063a1079d4e02f57826720d6c9b2eb8d635bbec0715'
)

source_aarch64=(
  "${_gh}/uniterm-linux-arm64-v${pkgver}.deb"
  "LICENSE::https://raw.githubusercontent.com/Teejer/uniterm/v${pkgver}/LICENSE"
)
sha256sums_aarch64=(
  '7c70defc7a94c70c25eb440b121c4ed45ddcd83487416a1fdd2280b7ced16bea'
  '80b7ddff03e2b4535e40a063a1079d4e02f57826720d6c9b2eb8d635bbec0715'
)

package() {
  # makepkg already unpacked the .deb (an ar archive) into $srcdir,
  # leaving its payload in data.tar.*. Install that verbatim: /usr/bin/uniterm,
  # /usr/share/applications/org.wails.uniterm.desktop (matches the Wayland
  # app_id; see upstream PR #1085) and the hicolor icons.
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
