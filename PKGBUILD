# Maintainer: Kristoffer Risanger <kristoffer@risanger.no>
#
# Template for the AUR package. The `aur` job in .github/workflows/release.yml
# fills in the version and checksum placeholders and pushes the result (with a
# regenerated .SRCINFO) to the AUR on every release.
pkgname=iptv-checker-gui
pkgver=1.6.0
pkgrel=1
pkgdesc="GUI for validating IPTV playlists and inspecting stream health"
arch=('x86_64' 'aarch64')
url="https://github.com/kristofferR/IPTVChecker"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'hicolor-icon-theme')
# The unrelated freearhey CLI package also installs /usr/bin/iptv-checker.
conflicts=('iptv-checker')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kristofferR/IPTVChecker/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/kristofferR/IPTVChecker/releases/download/v${pkgver}/IPTV.Checker_${pkgver}_lin_x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/kristofferR/IPTVChecker/releases/download/v${pkgver}/IPTV.Checker_${pkgver}_lin_arm.deb")
sha256sums=('508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1')
sha256sums_x86_64=('7f566f0b38dd7d67ff0129601010cd5e259f480e3bf990b71b5bb237dd028040')
sha256sums_aarch64=('56e03b380ea66bade898f5f024050b9ac19a3fe3b9d21118cbbfcdc934c1a711')

package() {
    # makepkg already extracted the .deb into srcdir; unpack its payload.
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    # The deb bundles ffmpeg/ffprobe sidecars; on Arch the app falls back to
    # the system ffmpeg on PATH, so drop them to avoid owning ffmpeg's files.
    rm "${pkgdir}/usr/bin/ffmpeg" "${pkgdir}/usr/bin/ffprobe"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
