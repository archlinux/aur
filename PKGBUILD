# Maintainer: NebulaTechs <NebulaTechs@users.noreply.github.com>
pkgname=xmclauncher-bin
pkgver=0.66.1
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern, open-source Minecraft Launcher (repackaged from the official .pacman artifact)"
arch=('x86_64')
url="https://xmcl.app/"
license=('MIT')
provides=('xmcl' 'xmcl-launcher')
conflicts=('xmcl-launcher')
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=(
  'jre8-openjdk: Minimum requirement for launching older game versions'
  'jre17-openjdk: Recommended Java version for launching version 1.17 and above'
  'jre21-openjdk: Recommended Java version for launching version 1.20.5+ and above'
  'flite: In-game narrator (Text-to-Speech) support'
  'gamemode: GameMode support for performance optimization'
  'libusb: Controller support (needed by mods like Controlify)'
  'nvidia-prime: Hybrid graphics support'
)
makedepends=('libarchive')
options=('!strip' '!debug')

# Official pre-built pacman package (a zstd-compressed pacman archive).
source_x86_64=("xmcl-0.66.1-x64.pacman::https://github.com/Voxelum/x-minecraft-launcher/releases/download/v0.66.1/xmcl-0.66.1-x64.pacman")

# Updated automatically by CI. The placeholder is replaced by scripts/update.sh.
sha256sums_x86_64=('bf999e0a37b75f2d56a9cc9634018bcd08b9963f950916a338329645f21596a5')

package() {
  # A .pacman file is a pacman package archive. Extract it, then install only the
  # payload directories; the [!.]*/ glob skips pacman metadata (.PKGINFO, .MTREE,
  # .BUILDINFO, .INSTALL) which all start with a dot.
  bsdtar -xf "${srcdir}/xmcl-${pkgver}-x64.pacman" -C "${srcdir}"
  cp -a "${srcdir}"/[!.]*/ "${pkgdir}/"

  # ---- Optional: launcher wrapper overrides ----
  # The upstream .pacman may ship a plain /usr/bin/xmcl without hardware/Wayland
  # tuning flags. If you hit sandbox or Wayland IME issues, uncomment the block
  # below to override it with a tuned wrapper.
  #
  # install -dm755 "${pkgdir}/usr/bin"
  # cat > "${pkgdir}/usr/bin/xmcl" <<'EOF'
  ##!/usr/bin/env bash
  # export PULSE_PROP='media.role=game'
  # export PULSE_LATENCY_MSEC=60
  # export APPIMAGE=1
  # OPTS=(
  #   "--enable-webrtc-pipewire-capturer"
  #   "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder"
  #   "--disable-gpu-driver-bug-workarounds"
  #   "--disable-dev-shm-usage"
  #   "--no-sandbox"
  # )
  # [[ "$XDG_SESSION_TYPE" == "wayland" ]] && OPTS+=("--enable-wayland-ime")
  # exec /opt/xmcl/xmcl "${OPTS[@]}" "$@"
  # EOF
  # chmod 755 "${pkgdir}/usr/bin/xmcl"
}
