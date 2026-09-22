# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>

# Waycast began as a fork of swaybeam (https://github.com/forkline/swaybeam)
# and has since been renamed. Upstream publishes `swaybeam` and `swaybeam-bin`
# to the AUR, and an earlier iteration of this package was called
# `swaybeam-hyprland-bin`; all are listed as conflicts because they install
# the same binary path, as does waycast-bin.
#
# This is the source package: it compiles the tagged release. `waycast-bin`
# installs the archives the Release workflow builds instead, and is the
# quicker choice for anyone without a reason to build. Both track the same
# releases and carry the same files.
#
# This is the canonical copy. .github/workflows/aur-publish.yml pushes it to
# the AUR when a release is published, rewriting pkgver, pkgrel and the
# checksum on the way. Edit anything else here; editing those is pointless
# because CI overwrites them.
#
# To publish by hand instead: set pkgver, run `updpkgsums`, regenerate
# .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`, and push both.

pkgname=waycast
pkgver=0.6.1
pkgrel=1
pkgdesc="Miracast source for wlroots compositors, with Hyprland extend-desktop support"
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

# Only what building adds. The headers this compiles against come from glib2,
# gstreamer and gst-plugins-base-libs, which are runtime dependencies already
# and so are installed for the build regardless.
makedepends=('cargo' 'pkgconf')

optdepends=(
  'xdg-desktop-portal-hyprland: screen capture on Hyprland'
  'xdg-desktop-portal-wlr: screen capture on Sway, River, Labwc'
  'hyprland: extend-desktop mode via a headless output'
  'gst-plugin-va: hardware H.264 encoding on Intel and AMD (VA-API)'
  'intel-media-driver: VA-API driver for Intel Broadwell and newer'
  'mesa: VA-API driver for AMD (provides libva-mesa-driver)'
  'dnsmasq: DHCP for the sink when waycast becomes the Wi-Fi Direct group owner'
)

conflicts=('waycast-bin' 'swaybeam' 'swaybeam-bin' 'swaybeam-hyprland-bin' 'swaybeam-hyprland-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae87216dad1a11eb0e84026751e1407d31a51d4e989e76dad8e6ffae035d10c9')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  # --locked so the build uses the committed Cargo.lock rather than whatever
  # resolves today, which is also what the project's own release build does.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # --frozen is --locked plus --offline: prepare() already fetched everything,
  # and a build that reaches the network is one that can differ from the one
  # whose lockfile was checked.
  cargo build --frozen --release --bin waycast --bin waycast-networkd
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 target/release/waycast-networkd "${pkgdir}/usr/lib/waycast/waycast-networkd"
  install -Dm0644 contrib/networkd/waycast-networkd.service "${pkgdir}/usr/lib/systemd/system/waycast-networkd.service"
  install -Dm0644 contrib/networkd/org.waycast.Network1.service "${pkgdir}/usr/share/dbus-1/system-services/org.waycast.Network1.service"
  install -Dm0644 contrib/networkd/org.waycast.Network1.conf "${pkgdir}/usr/share/dbus-1/system.d/org.waycast.Network1.conf"
  install -Dm0644 contrib/networkd/org.waycast.network.policy "${pkgdir}/usr/share/polkit-1/actions/org.waycast.network.policy"
  install -Dm0644 contrib/networkd/60-waycast-network.rules "${pkgdir}/usr/share/polkit-1/rules.d/60-waycast-network.rules"
  install -Dm0644 contrib/networkd/install.py "${pkgdir}/usr/share/waycast/networkd/install.py"
  install -Dm0644 docs/network-helper.md "${pkgdir}/usr/share/doc/${pkgname}/network-helper.md"
  install -Dm0644 docs/networking.md "${pkgdir}/usr/share/doc/${pkgname}/networking.md"
  install -Dm0755 target/release/waycast "${pkgdir}/usr/bin/waycast"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
