# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>

# Waycast began as a fork of swaybeam (https://github.com/forkline/swaybeam)
# and has since been renamed. Upstream publishes `swaybeam` and `swaybeam-bin`
# to the AUR, and an earlier iteration of this package was called
# `swaybeam-hyprland-bin`; all three are listed as conflicts because they
# install the same binary path.
#
# Installs the archives built by the project's Release workflow rather than
# compiling, so no Rust toolchain is needed. Those archives are dynamically
# linked against GStreamer, PipeWire and glib and are built on Ubuntu 24.04,
# so they need glibc 2.39 or newer -- fine on Arch, and the reason the
# depends list below is not merely `glibc`.
#
# Refreshing for a new release: bump pkgver, then `updpkgsums` to pull the
# real checksums. They are SKIP here only because the assets for this version
# are not published yet; a -bin package should carry real sums.

pkgname=waycast-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Miracast source for wlroots compositors, with Hyprland extend-desktop support (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemy/waycast"
license=('MIT')

# Linked at build time: confirmed with ldd against a release build, not
# guessed. gst-plugins-base-libs also supplies videoscale.
depends=(
  'glib2'
  'gstreamer'
  'gst-plugins-base-libs'

  # Loaded at runtime by the streaming pipeline. Each was resolved by asking
  # gst-inspect which .so provides the element and pacman which package owns
  # it, so this list matches the pipeline waycast actually builds:
  #   pipewiresrc  -> gst-plugin-pipewire      (screen capture)
  #   imagefreeze  -> gst-plugins-good         (keeps an idle output flowing)
  #   pulsesrc     -> gst-plugins-good         (audio)
  #   rtpmp2tpay   -> gst-plugins-good         (RTP payloader)
  #   mpegtsmux    -> gst-plugins-bad-libs     (transport stream)
  #   faac         -> gst-plugins-bad          (AAC audio)
  #   x264enc      -> gst-plugins-ugly         (software H.264)
  'gst-plugin-pipewire'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-bad-libs'
  'gst-plugins-ugly'

  # Session and transport.
  'pipewire'
  'wireplumber'
  'networkmanager'
  'wpa_supplicant'
  'xdg-desktop-portal'
)

optdepends=(
  'xdg-desktop-portal-hyprland: screen capture on Hyprland'
  'xdg-desktop-portal-wlr: screen capture on Sway, River, Labwc'
  'hyprland: extend-desktop mode via a headless output'
  'gst-plugin-va: hardware H.264 encoding on Intel and AMD (VA-API)'
  'intel-media-driver: VA-API driver for Intel Broadwell and newer'
  'mesa: VA-API driver for AMD (provides libva-mesa-driver)'
  'dnsmasq: DHCP for the sink when waycast becomes the Wi-Fi Direct group owner'
)

conflicts=('swaybeam' 'swaybeam-bin' 'swaybeam-hyprland-bin' 'swaybeam-hyprland-git')

# The Release workflow labels archives amd64/arm64, the usual naming for a
# generic Linux download; Arch calls the same machines x86_64/aarch64. Using
# per-architecture source arrays keeps that translation declarative instead of
# unpicking $CARCH in a build function.
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("waycast-v${pkgver}-linux-amd64.tar.gz::${_release}/waycast-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("waycast-v${pkgver}-linux-arm64.tar.gz::${_release}/waycast-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('bc17b28ec9479dcb261ce5b7381fcc9ccf1283ec7bcdb65b38bb91b54dd9f320')
sha256sums_aarch64=('9175d8d0fbec26b9362bfdb9b4ca182bea115d235e358fd715e4393aed603c40')

package() {
  local _slug
  case "$CARCH" in
    x86_64) _slug=amd64 ;;
    aarch64) _slug=arm64 ;;
    *) echo "unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  cd "waycast-v${pkgver}-linux-${_slug}"
  install -Dm0755 waycast "${pkgdir}/usr/bin/waycast"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
