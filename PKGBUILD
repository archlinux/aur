# Maintainer: Keith Vassallo <keith@vassallo.cloud>
#
# Template. `just aur` / `just aur-publish` render this into a real PKGBUILD,
# substituting 0.4.3 and 9806534349ea78b69e51a0d7649616c7711eacd4aa395b39ce0916c6d4eb3a23 from the published GitHub release.
# Edit this file, never the generated one.
#
# This repackages the official amd64 .deb rather than building from source, so
# it inherits the binary, the .desktop file and both icons (including the
# hicolor status tray icon the app looks up by name) with nothing to keep in
# sync by hand. The `clustercut://` scheme is registered by the app at runtime,
# so no MimeType wiring is needed here.
pkgname=clustercut-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Cross-platform clipboard sync between your devices"
arch=('x86_64')
url="https://github.com/keithvassallomt/ClusterCut"
license=('GPL-3.0-or-later')
# webkit2gtk-4.1 and gtk3 are linked directly (libwebkit2gtk-4.1.so.0,
# libjavascriptcoregtk-4.1.so.0, libgtk-3.so.0). libayatana-appindicator is
# dlopen'd at runtime for the tray icon — not in NEEDED, but the tray is not
# optional for this app, so it stays a hard dependency.
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=("clustercut=${pkgver}")
conflicts=('clustercut')
options=('!strip' '!debug')
source=("ClusterCut_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/ClusterCut_${pkgver}_amd64.deb")
sha256sums=('9806534349ea78b69e51a0d7649616c7711eacd4aa395b39ce0916c6d4eb3a23')

package() {
    # Match data.tar.* by glob so a future bundler switching gzip for xz/zst
    # keeps working; the inner bsdtar auto-detects the compression.
    bsdtar -O -xf "ClusterCut_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -C "${pkgdir}" -xf -
}
