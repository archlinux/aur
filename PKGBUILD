# Maintainer: kristofferR <481270+kristofferR@users.noreply.github.com>
#
# Template for the AUR package. The `aur` job in .github/workflows/release.yml
# fills in the version and checksum placeholders and pushes the result (with a
# regenerated .SRCINFO) to the AUR on every release.
pkgname=iptv-checker-gui
pkgver=2.0.0
pkgrel=1
pkgdesc="GUI for validating IPTV playlists and inspecting stream health"
arch=('x86_64' 'aarch64')
url="https://github.com/kristofferR/IPTVChecker"
license=('MIT')
# WebKitGTK lists the GStreamer plugin sets as optdepends, but they are hard
# requirements here: without gst-plugins-good the WebProcess aborts on
# RELEASE_ASSERT(audioSink) in MediaPlayerPrivateGStreamer::createAudioSink()
# as soon as playback starts, and without gst-libav/gst-plugins-bad there is
# no H.264/AAC decoding for the streams this app exists to play.
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'ffmpeg' 'hicolor-icon-theme'
         'gst-plugins-good' 'gst-plugins-bad' 'gst-libav')
# The unrelated freearhey CLI package also installs /usr/bin/iptv-checker.
conflicts=('iptv-checker')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kristofferR/IPTVChecker/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/kristofferR/IPTVChecker/releases/download/v${pkgver}/IPTV.Checker_${pkgver}_lin_x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/kristofferR/IPTVChecker/releases/download/v${pkgver}/IPTV.Checker_${pkgver}_lin_arm.deb")
sha256sums=('508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1')
sha256sums_x86_64=('8708ebd187bf217670a9267e9ef101454025566e1a237b7f8800bd2a9b188cfd')
sha256sums_aarch64=('849d205db6d354b319b2a3f83a3d7a5dac2fdc29f5537b14c7e1dec6d25a3814')

package() {
    # makepkg already extracted the .deb into srcdir; unpack its payload.
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    # The deb bundles ffmpeg/ffprobe sidecars; on Arch the app falls back to
    # the system ffmpeg on PATH, so drop them to avoid owning ffmpeg's files.
    rm "${pkgdir}/usr/bin/ffmpeg" "${pkgdir}/usr/bin/ffprobe"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
