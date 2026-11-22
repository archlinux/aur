# Maintainer: ShibbityShwab
# Contributor: ShibbityShwab

# Prebuilt ("-bin") AUR package for LightSpeed, the zero-cost global network
# optimizer for multiplayer games: https://github.com/ShibbityShwab/lightspeed
#
# Downloads the cargo-dist release tarballs from GitHub Releases (v1.12.3):
#   - lightspeed       : CLI client  (x86_64 and aarch64)
#   - lightspeed-gui   : egui tray GUI (x86_64 only - upstream publishes no
#                        aarch64-unknown-linux-gnu build of the GUI)
#
# There is no upstream source tarball (dist source-tarball = false) and no
# compile step: this package only fetches the prebuilt binaries.
#
# The Linux binaries link only against glibc/libgcc (verified via ldd), so
# depends=() is empty. The GUI additionally dlopens X11/Wayland/EGL/GL at
# runtime via winit/glutin; on a bare headless system install mesa,
# libxkbcommon and the wayland/X11 libs for it to start.
#
# Updating: bump pkgver (pkgrel resets to 1), refresh the sha256 sums from the
# release, regenerate .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`, and
# let the release workflow's publish-aur job (or infra/scripts/publish-aur.sh)
# push it to the AUR. See README.md.

pkgname=lightspeed-bin
pkgver=1.12.3
pkgrel=1
pkgdesc="Zero-cost global network optimizer for multiplayer games - prebuilt LightSpeed CLI client and x86_64 GUI tray app"
arch=('x86_64' 'aarch64')
url="https://github.com/ShibbityShwab/lightspeed"
license=('custom:LightSpeed-NC-1.1')
depends=()
options=('!strip')  # keep upstream cargo-dist artifacts byte-identical (Sigstore attestations)

# Binary tarballs: the Linux cargo-dist targets are named
# lightspeed-{client,gui}-<target-triple>.tar.xz and extract to a top-level
# directory named after the tarball.
source_x86_64=(
  "https://github.com/ShibbityShwab/lightspeed/releases/download/v${pkgver}/lightspeed-client-x86_64-unknown-linux-gnu.tar.xz"
  "https://github.com/ShibbityShwab/lightspeed/releases/download/v${pkgver}/lightspeed-gui-x86_64-unknown-linux-gnu.tar.xz"
)
source_aarch64=(
  "https://github.com/ShibbityShwab/lightspeed/releases/download/v${pkgver}/lightspeed-client-aarch64-unknown-linux-gnu.tar.xz"
)

# sha256 of the v1.12.3 release assets, checked against the published
# release digests on 2026-11-20 (see README.md "Local verification").
sha256sums_x86_64=(
  '673327db91f4a02b54e88f4d81fd5ab575082fd0fb15b181f8c11755f10bf21d'
  'b9f9cb78f6d3b08db32579a1faed93bb3d0cd4b640c79218e49ddff8086f805f'
)
sha256sums_aarch64=(
  '06d9f4698f0b7c5f890d3bc2f7f2f25c7177bb60cb5727cc2a20ced86fbb1eba'
)

package() {
  # CLI client (both arches)
  install -Dm755 "$srcdir"/lightspeed-client-*/lightspeed "$pkgdir/usr/bin/lightspeed"

  # GUI tray app (x86_64 only - no aarch64 linux asset upstream)
  if [[ $CARCH == x86_64 ]]; then
    install -Dm755 "$srcdir"/lightspeed-gui-*/lightspeed-gui "$pkgdir/usr/bin/lightspeed-gui"
  fi

  # Custom noncommercial license
  install -Dm644 "$srcdir"/lightspeed-client-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
