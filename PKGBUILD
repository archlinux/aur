# Maintainer: panxuc <https://github.com/panxuc>
#
# uur — native Linux companion for NetEase UU Remote.
# Installs a regular desktop application: the uur binary, the Windows PE
# hook components built with mingw, and desktop entries.  Nothing touches
# the user's system at runtime except the managed per-user Wine prefix;
# the NetEase client itself is downloaded from the official feed on first
# `uur setup` (it is never redistributed by this package).

pkgname=uur
pkgver=0.1.1
pkgrel=1
pkgdesc="Native Linux companion for NetEase UU Remote (X11/Wayland input and capture bridge)"
arch=('x86_64')
url="https://github.com/panxuc/uur"
license=('MIT')
depends=(
    'glibc'
    'gcc-libs'
    'glib2'
    'wine'
    'curl'
    'pipewire'
    'xdg-desktop-portal'
)
makedepends=('cargo' 'gcc' 'pkgconf' 'mingw-w64-gcc' 'mingw-w64-binutils')
optdepends=(
    'osslsigncode: Authenticode verification of official updater downloads'
    'xdg-desktop-portal-gnome: GNOME, niri, and compatible Wayland capture/input'
    'xdg-desktop-portal-kde: KDE Plasma Wayland capture/input'
    'xdg-desktop-portal-hyprland: Hyprland screen capture (input uses uinput)'
    'xdg-desktop-portal-wlr: wlroots screen capture (input uses uinput)'
    'xwayland-satellite: X11 application support on niri'
    'ethtool: inspect and configure Wake-on-LAN'
    'networkmanager: persist Wake-on-LAN for NetworkManager connections'
    'pulseaudio: legacy PulseAudio server for Wine audio'
    'pipewire-pulse: PulseAudio-compatible Wine audio on PipeWire'
    'libva-utils: VA-API capability diagnostics'
    'vulkan-tools: Vulkan and Vulkan Video capability diagnostics'
    'nvidia-utils: NVENC and NVDEC capability diagnostics on NVIDIA GPUs'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("30a00b89e880b8db010fcf4035e1b8d073d7bfb61542b2029ecf9b660464d4c7")
install=uur.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
    ./hook/build.sh
    ./capture/build.sh
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./packaging/stage.sh "${pkgdir}"
}
