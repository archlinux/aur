# Maintainer: FlowShield <noreply@flowshield.app>
#
# Rendered from scripts/release/aur/PKGBUILD.template in the FlowShield
# repo. The publish-to-aur job in .github/workflows/desktop-v3-release.yml
# substitutes the version and checksum placeholders at release time, then
# commits the result to the AUR repository.
#
# To regenerate locally:
#   scripts/release/update-aur.sh v3.x.y   (run from inside flowshield-aur clone)

pkgname=flowshield-bin
_pkgname=flowshield
# AUR forbids hyphens in pkgver, so prereleases get hyphens converted to
# dots (3.2.1-alpha.0 → 3.2.1.alpha.0). _tagver keeps the original form
# for the GitHub URL, which uses the literal release tag.
pkgver=3.6.0.alpha.0
_tagver=3.6.0-alpha.0
pkgrel=1
pkgdesc='Cross-platform productivity tracker that pairs with the FlowShield web dashboard'
arch=('x86_64')
url='https://flowshield.app'
license=('MIT')
# Runtime libs the AppImage links against. webkit2gtk-4.1 is the big one;
# libayatana-appindicator powers the system tray icon; gtk3 covers the rest
# of the GUI surface. We don't extract the AppImage, so its bundled libs
# stay sandboxed inside it — but it still needs the host's webkit2gtk.
depends=(
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'gtk3'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/asifthewebguy/FlowShield/releases/download/v${_tagver}/FlowShield_${_tagver}_amd64.AppImage")
sha256sums=('7cba224b51b03e06bfa2db90e2630158f2acc2f4ea7a3ade5ccccc43b356f530')
noextract=("${_pkgname}-${pkgver}.AppImage")

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/usr/bin/env bash
exec /opt/${pkgname}/${_pkgname}.AppImage "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
