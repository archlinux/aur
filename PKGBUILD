# Maintainer: ShibbityShwab
# Contributor: LightSpeed Contributors

# Prebuilt ("-bin") AUR package for LightSpeed, the zero-cost global network
# optimizer for multiplayer games: https://github.com/ShibbityShwab/lightspeed
#
# Downloads the cargo-dist release tarballs from GitHub Releases (v1.11.0):
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
pkgver=1.11.0
pkgrel=1
pkgdesc="Zero-cost global network optimizer for multiplayer games - prebuilt LightSpeed CLI client and x86_64 GUI tray app"
arch=('x86_64' 'aarch64')
url="https://github.com/ShibbityShwab/lightspeed"
license=('custom:LightSpeed-NC-1.0')
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

# sha256 of the v1.11.0 release assets, checked against the published
# release digests on 2026-11-17 (see README.md "Local verification").
sha256sums_x86_64=(
  'd77cb662c5b39610eb6b63b8866a223093053e378bba02ba4f27ebda2b3f3307'
  '86bf64593fa39790b595611933089c762b725431427495b38dbc1ae21974affc'
)
sha256sums_aarch64=(
  '85183d651b3f2a1e326e184360e1d263c560bb678059d55a8e959e32721b43fe'
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
