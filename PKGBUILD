# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>

# Waycast began as a fork of swaybeam (https://github.com/forkline/swaybeam)
# and has since been renamed. Upstream publishes `swaybeam` and `swaybeam-bin`
# to the AUR, and an earlier iteration of this package was called
# `swaybeam-hyprland-bin`; all three are listed as conflicts because they
# install the same binary path.
#
# Installs the archives built by the project's Release workflow rather than
# compiling, so no Rust toolchain is needed. `waycast` is the source package
# for anyone who would rather build; both track the same releases and install
# the same files. Those archives are dynamically
# linked against GStreamer, PipeWire and glib and are built on Ubuntu 24.04,
# so they need glibc 2.39 or newer -- fine on Arch, and the reason the
# depends list below is not merely `glibc`.
#
# This is the canonical copy. .github/workflows/aur-publish.yml pushes it to
# the AUR when a release is published, rewriting three fields on the way --
# pkgver from the tag, pkgrel back to 1, and both checksums from the .sha256
# files the Release workflow publishes beside the archives. Edit anything
# else here; editing those three is pointless because CI overwrites them.
#
# To publish by hand instead: set pkgver, run `updpkgsums`, regenerate
# .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`, and push both.

pkgname=waycast-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Miracast source for wlroots compositors, with Hyprland extend-desktop support (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemy/waycast"
license=('MIT')
install=waycast.install

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
  'ufw'
  'iptables'
  'iproute2'
  'polkit'
  'python'
  'systemd'
  'dbus'
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

# `waycast` is the same project built from source and installs the same
# paths, so the two cannot be co-installed; `provides` lets anything that
# depends on waycast be satisfied by either.
provides=("waycast=${pkgver}")
conflicts=('waycast' 'swaybeam' 'swaybeam-bin' 'swaybeam-hyprland-bin' 'swaybeam-hyprland-git')

# The Release workflow labels archives amd64/arm64, the usual naming for a
# generic Linux download; Arch calls the same machines x86_64/aarch64. Using
# per-architecture source arrays keeps that translation declarative instead of
# unpicking $CARCH in a build function.
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("waycast-v${pkgver}-linux-amd64.tar.gz::${_release}/waycast-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("waycast-v${pkgver}-linux-arm64.tar.gz::${_release}/waycast-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('af118d64e7f2d3cbab30806fd274b3d128e6c796e176a59b1d3e5a75a83e3a21')
sha256sums_aarch64=('265ce1ab51955049d870e7df02f2e1c6b191d875c0d94d923c166b672ef59863')

package() {
  local _slug
  case "$CARCH" in
    x86_64) _slug=amd64 ;;
    aarch64) _slug=arm64 ;;
    *) echo "unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  cd "waycast-v${pkgver}-linux-${_slug}"
  if [[ ! -f waycast-networkd || ! -f contrib/networkd/install.py ]]; then
    error "This release predates network-helper packaging; update pkgver and checksums to a new release."
    return 1
  fi
  install -Dm0755 waycast-networkd "${pkgdir}/usr/lib/waycast/waycast-networkd"
  install -Dm0644 contrib/networkd/waycast-networkd.service "${pkgdir}/usr/lib/systemd/system/waycast-networkd.service"
  install -Dm0644 contrib/networkd/org.waycast.Network1.service "${pkgdir}/usr/share/dbus-1/system-services/org.waycast.Network1.service"
  install -Dm0644 contrib/networkd/org.waycast.Network1.conf "${pkgdir}/usr/share/dbus-1/system.d/org.waycast.Network1.conf"
  install -Dm0644 contrib/networkd/org.waycast.network.policy "${pkgdir}/usr/share/polkit-1/actions/org.waycast.network.policy"
  install -Dm0644 contrib/networkd/60-waycast-network.rules "${pkgdir}/usr/share/polkit-1/rules.d/60-waycast-network.rules"
  install -Dm0644 contrib/networkd/install.py "${pkgdir}/usr/share/waycast/networkd/install.py"
  install -Dm0644 docs/network-helper.md "${pkgdir}/usr/share/doc/${pkgname}/network-helper.md"
  install -Dm0644 docs/networking.md "${pkgdir}/usr/share/doc/${pkgname}/networking.md"
  install -Dm0755 waycast "${pkgdir}/usr/bin/waycast"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
