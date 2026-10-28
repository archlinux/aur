# Maintainer: undefined-ux <undefined_1@outlook.com>
pkgname=rustconn-bin
pkgver=0.24.0
pkgrel=1
pkgdesc='Modern GTK4 connection manager for SSH, RDP, VNC and SPICE (prebuilt)'
arch=('x86_64')
url='https://github.com/totoshko88/RustConn'
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc>=2.39'
  'graphene'
  'gtk4>=4.14'
  'libadwaita>=1.5'
  'openssh'
  'openssl>=3.0'
  'pango'
  'vte4>=0.76'
  'webkitgtk-6.0>=2.40'
  'which'
  'zlib'
)
checkdepends=('appstream' 'desktop-file-utils')
optdepends=(
  '1password-cli: 1Password credential storage'
  'aws-cli: AWS connections'
  'aws-session-manager-plugin: AWS SSM connections'
  'azure-cli: Azure connections'
  'bitwarden-cli: Bitwarden credential storage'
  'boundary: Boundary connections'
  'cloudflared: Cloudflare connections'
  'freerdp: External RDP client fallback'
  'google-cloud-cli: Google Cloud connections'
  'keepassxc: KeePassXC credential storage'
  'kubectl: Shell access to Kubernetes pods'
  'libappindicator: Display icon in system tray'
  'libsecret: secret-tool for importing credentials'
  'mc: SFTP via Midnight Commander FISH VFS'
  'mosh: MOSH connections'
  'oci-cli: Oracle Cloud connections'
  'openh264: H.264 decoding for embedded RDP'
  'pass: Password Store credential storage'
  'passbolt-cli: Passbolt credential storage'
  'picocom: Serial connections'
  'tailscale: Tailscale connections'
  'teleport: Teleport connections'
  'tigervnc: External VNC client fallback'
  'virt-viewer: External SPICE client'
  'waypipe: Wayland application forwarding over SSH'
)
provides=("rustconn=$pkgver")
conflicts=('rustconn' 'rustconn-appimage')
options=('!strip' '!debug')

_app_id=io.github.totoshko88.RustConn
_deb="rustconn_${pkgver}_amd64.deb"
source=(
  "$url/releases/download/v$pkgver/$_deb"
  "${_app_id}-rdp.xml"
  "${_app_id}-vv.xml"
)
noextract=("$_deb")
sha256sums=(
  'b4e4a333e42faf5dfea19f2cd1ae3d3895d1d60026d2fa0aca7f54a210c83e30'
  '6752641f8272fae15901cc4de4052514e846821fbeba797baa8d81850d508cda'
  'e833e539337e3a348f21a6757f015bfc7994df0789771880550350f0d04c45f0'
)

prepare() {
  bsdtar -xf "$_deb" data.tar.zst
  mkdir -p deb-root
  bsdtar -xf data.tar.zst -C deb-root
}

check() {
  desktop-file-validate "deb-root/usr/share/applications/${_app_id}.desktop"
  appstreamcli validate --no-net "deb-root/usr/share/metainfo/${_app_id}.metainfo.xml"
  deb-root/usr/bin/rustconn --version
  deb-root/usr/bin/rustconn-cli --version
}

package() {
  cp -a --no-preserve=ownership deb-root/usr "$pkgdir/"
  mv "$pkgdir/usr/share/doc/rustconn" "$pkgdir/usr/share/doc/$pkgname"

  # The upstream deb omits these MIME definitions from its source tree.
  install -Dm644 "${_app_id}-rdp.xml" "${_app_id}-vv.xml" \
    -t "$pkgdir/usr/share/mime/packages/"
}
