# Maintainer: undefined-ux <undefined_1@outlook.com>
pkgname=rustconn-appimage
pkgver=0.24.1
pkgrel=1
pkgdesc='Modern GTK4 connection manager for SSH, RDP, VNC and SPICE (AppImage)'
arch=('x86_64')
url='https://github.com/totoshko88/RustConn'
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'bash'
  'coreutils'
  'dbus'
  'e2fsprogs'
  'fontconfig'
  'fribidi'
  'fuse2'
  'gcc-libs'
  'glib2'
  'glibc>=2.39'
  'gmp'
  'harfbuzz'
  'libgpg-error'
  'mesa'
  'openssh'
  'which'
  'zlib'
)
checkdepends=('desktop-file-utils')
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
  'xorg-xwayland: Run the upstream X11 AppImage on Wayland'
)
provides=("rustconn=$pkgver")
conflicts=('rustconn')
options=('!strip' '!debug')

_app_id=io.github.totoshko88.RustConn
_appimage="RustConn-${pkgver}-x86_64.AppImage"
_installdir=/opt/rustconn
source=(
  "$url/releases/download/v$pkgver/$_appimage"
  "${_app_id}-rdp.xml"
  "${_app_id}-vv.xml"
)
noextract=("$_appimage")
sha256sums=(
  '68d8bd7a214402af837b7bca0c3bf507ec159177ebeb1de7f7ebabf7854bf497'
  '6752641f8272fae15901cc4de4052514e846821fbeba797baa8d81850d508cda'
  'e833e539337e3a348f21a6757f015bfc7994df0789771880550350f0d04c45f0'
)

prepare() {
  chmod u+x "$_appimage"
  ./"$_appimage" --appimage-extract > /dev/null
  sed -i "s|^Exec=.*|Exec=${_installdir}/RustConn.AppImage %f|" \
    "squashfs-root/${_app_id}.desktop"
}

check() {
  desktop-file-validate "squashfs-root/${_app_id}.desktop"
  squashfs-root/AppRun --version
}

package() {
  install -Dm755 "$_appimage" "$pkgdir$_installdir/RustConn.AppImage"
  install -d "$pkgdir/usr/bin"
  ln -s "$_installdir/RustConn.AppImage" "$pkgdir/usr/bin/rustconn"

  install -Dm644 "squashfs-root/${_app_id}.desktop" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "squashfs-root/usr/share/metainfo/${_app_id}.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"

  local size
  for size in 128x128 256x256; do
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/$size/apps/${_app_id}.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/${_app_id}.png"
  done
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"

  # The release AppImage omits these upstream MIME definitions.
  install -Dm644 "${_app_id}-rdp.xml" "${_app_id}-vv.xml" \
    -t "$pkgdir/usr/share/mime/packages/"
}
