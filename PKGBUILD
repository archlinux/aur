# Maintainer: Suman Shrestha <suman.shrestha@cyberarrow.io>
#
# `-bin` package: it downloads the prebuilt .deb from the PUBLIC distribution
# repo and repackages it — no source, no Rust/Node toolchain. This is what lets
# agentpane ship on the AUR while its source repository stays private (the same
# way slack-desktop, zoom, visual-studio-code-bin etc. are distributed).
pkgname=agentpane-bin
_pkgname=agentpane
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage many terminal and AI-agent sessions from one keyboard-driven window"
arch=('x86_64')
url="https://github.com/Summonshr/agentpane"
license=('MIT')
# Runtime: WebKitGTK 4.1 (the Tauri v2 webview) pulls in gtk3/libsoup3;
# libayatana-appindicator backs the tray icon.
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('agentpane')
conflicts=('agentpane' 'agentpane-git')
options=('!strip')  # the release binary is already stripped by CI
# Prebuilt artifact from the public dist repo. Source repo can stay private —
# only this URL needs to be publicly fetchable, which is an AUR requirement.
source=("${_pkgname}-${pkgver}.deb::https://github.com/Summonshr/agentpane-dist/releases/download/v${pkgver}/agentpane_${pkgver}_amd64.deb")
# sha256 of the v0.1.0 .deb. On future version bumps, re-pin with:
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('660c0ba623d07c4d8b3ec41b0b399b81df118865cde5c8c970210f5fb0dbed38')

package() {
  cd "$srcdir"
  # A .deb is an `ar` archive; unpack it, then lay its /usr tree into $pkgdir.
  ar x "${_pkgname}-${pkgver}.deb"
  tar -xf data.tar.* -C "$pkgdir/"
}
