# Maintainer: Faizan Asad <m.faizanasad97@gmail.com>

pkgname=zuno
pkgver=1.3.2
pkgrel=1
pkgdesc="YouTube Music as a focused desktop app — tabs, offline downloads, synced lyrics"
arch=('x86_64')
url="https://github.com/noFAYZ/zuno"
license=('Apache-2.0')

# Mapped from the .deb's own Depends: libwebkit2gtk-4.1-0, libgtk-3-0,
# libayatana-appindicator3-1.
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
)

# Playback runs through WebKitGTK, which decodes via GStreamer. Unlike the AppImage — which
# ships its own WebKitGTK and needs its plugins bundled with it — this package uses the
# system's, so the plugins are ordinary dependencies and there is no bundle to get wrong.
# gst-libav supplies the AAC and H.264 decoding YouTube streams need; without it playback
# fails with "GStreamer element appsink not found" and player error 5.
depends+=(
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-libav'
)

# The Rust audio engine bypasses WebKitGTK entirely: cpal opens ALSA directly, and libopus is
# statically linked in rather than loaded, so only the ALSA runtime is needed here. The
# GStreamer plugins above stay because the IFrame engine is still the default.
depends+=(
  'alsa-lib'
)

# Native MPRIS2 controls talk to the session bus directly via souvlaki.
depends+=(
  'dbus'
)

optdepends=(
  'gst-plugins-bad: extra container and codec support'
  'gst-plugins-ugly: extra codec support'
  'xdg-utils: opening links and the log file from inside the app'
  'libnotify: desktop notifications'
)

# Installs the same files as the community-maintained binary package, so the two cannot
# be installed together.
conflicts=('zuno-bin')

# The binary is already stripped and relocation-sensitive; leave it alone.
options=('!strip' '!emptydirs')

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Zuno_${pkgver}_amd64.deb")
sha256sums=('1ca3810deb44a480ad95df0b6e61fc797f68a6a0f45275ea1eabbeb14f91c5c8')

package() {
  # bsdtar reads the ar archive and the inner tarball without needing dpkg installed.
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -

  install -Dm644 "${pkgdir}/usr/share/applications/Zuno.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  rm -f "${pkgdir}/usr/share/applications/Zuno.desktop"
}
