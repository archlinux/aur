# Maintainer: Dark Witcher <archlinux.sulfide764@passmail.net>

pkgname=droidcam-client-bin
pkgver=7.2.1
pkgrel=1
pkgdesc="DroidCam Client with bundled OBS runtime (prebuilt binary)"
arch=('x86_64')
url="https://www.dev47apps.com/"
license=('LicenseRef-Proprietary')
options=('!debug')
install=droidcam-client-bin.install

pkgver() {
    ar p "$srcdir/droidcam_client_amd64.deb" control.tar.xz |
        tar -xJO ./control |
        sed -n 's/^Version: //p'
}

depends=(
  'qt5-base'
  'qt5-svg'
  'qt5-wayland'
  'curl'
  'libpulse'
  'pciutils'
  'speexdsp'
  'v4l2loopback-dkms'
  'v4l2loopback-utils'
)

source=(
  "droidcam_client_amd64.deb::https://droidcam.app/go/droidCam.client.setup.deb"
  "droidcam-virtual-camera.service"
  "droidcam-virtual-camera-helper"
)

sha256sums=(
  'SKIP'
  'b9b5e2413e0f962bb1d33fd055fc49903b30dcb6696338fc4458dee6456c396d'
  'b617ed996389419ab4f11033ff0042a5391be179eeb29a1469f6cfa0e15a8f30'
)

package() {
  # Extract Debian package
  ar x "$srcdir/droidcam_client_amd64.deb"

  # Extract package payload
  local data_tar
  data_tar=$(find . -maxdepth 1 -name 'data.tar.*' -print -quit)

  if [[ -z "$data_tar" ]]; then
    printf '%s\n' "ERROR: Could not find data.tar.* in Debian package" >&2
    return 1
  fi

  tar -xf "$data_tar" -C "$pkgdir"

  # Move upstream launcher to the Arch-standard location
  install -d "$pkgdir/usr/bin"
  mv "$pkgdir/usr/local/bin/droidcam" "$pkgdir/usr/bin/droidcam"

  # Remove now-empty /usr/local hierarchy
  rmdir "$pkgdir/usr/local/bin"
  rmdir "$pkgdir/usr/local"

  # Install DroidCam virtual camera integration
  install -Dm755 \
    "$srcdir/droidcam-virtual-camera-helper" \
    "$pkgdir/opt/droidcam-obs-client/bin/64bit/droidcam-virtual-camera-helper"

  install -Dm644 \
    "$srcdir/droidcam-virtual-camera.service" \
    "$pkgdir/usr/lib/systemd/system/droidcam-virtual-camera.service"

  # Provide the v4l2loopback control utility where DroidCam expects it
  ln -sf /usr/bin/v4l2loopback-ctl \
    "$pkgdir/opt/droidcam-obs-client/bin/64bit/v4l2loopback-ctl"

  # Update desktop entry to use the Arch-standard launcher path
  sed -i \
    's#^Exec=/usr/local/bin/droidcam#Exec=/usr/bin/droidcam#' \
    "$pkgdir/usr/share/applications/com.dev47apps.droidcam.desktop"

  # Install DroidCam license information
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
DroidCam is proprietary software.
See https://www.dev47apps.com/ for license terms.
EOF

  # Preserve the bundled OBS Studio GPLv2 license
  install -Dm644 \
    "$pkgdir/opt/droidcam-obs-client/data/obs-studio/license/gplv2.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/gplv2.txt"
}
