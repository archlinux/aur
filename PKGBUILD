# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rustconn
_app_id=io.github.totoshko88.RustConn
pkgver=0.19.3
pkgrel=1
pkgdesc="Modern connection manager for Linux with GTK4/Wayland-native interface."
arch=('x86_64')
url="https://github.com/totoshko88/RustConn"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'dbus'
  'gtk4'
  'libadwaita'
  'openssh'
  'openssl'
  'vte4'
  'webkitgtk-6.0'
  'which'
  'zstd'
)
makedepends=('cargo')
optdepends=(
  '1password-cli: Password storage method option'
  'aws-cli: AWS CLI'
  'aws-session-manager-plugin: AWS SSM Plugin'
  'azure-cli: Azure CLI'
  'bitwarden-cli: Password storage method option'
  'boundary: Boundary CLI'
  'cloudflared: Cloudflare CLI'
  'freerdp: External RDP client fallback'
  'google-cloud-cli: Google Cloud CLI'
  'gtk-vnc: VNC Client option'
  'inetutils: Telnet client'
  'keepassxc: Password storage method option'
  'krdc: VNC client option'
  'kubectl: Shell access to Kubernetes pods'
  'libappindicator: Display icon in system tray'
  'libsecret: Password storage method fallback'
  'mc: SFTP via Midnight Commander FISH VFS'
  'mosh: External MOSH client'
  'oci-cli: OCI CLI'
  'pass: Password storage method option'
  'passbolt-cli: Password storage method option'
  'picocom: Serial terminal client'
  'realvnc-vnc-viewer: VNC client option'
  'remmina: VNC client option'
  'tailscale: Tailscale CLI'
  'teleport: Teleport CLI'
  'tigervnc: External VNC client fallback'
  'virt-viewer: External SPICE client fallback'
  'waypipe: Wayland application forwarding for SSH connections'
)
source=("RustConn-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5f394589e5537e02ad29be2ae7f4d1357fa7f5dd19e2c3be843491ea5ef5c87')

prepare() {
  cd "RustConn-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "RustConn-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release \
    -p "$pkgname" --features adw-1-8,web-embedded \
    -p "$pkgname-cli" --features full
}

check() {
  cd "RustConn-$pkgver"
  appstreamcli validate --no-net "$pkgname/assets/${_app_id}.metainfo.xml"
  desktop-file-validate "$pkgname/assets/${_app_id}.desktop"
}

package() {
  cd "RustConn-$pkgver"
  install -Dm755 target/release/{"$pkgname","$pkgname-cli"} -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname/assets/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "$pkgname/assets/${_app_id}.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"
  install -Dm644 "$pkgname/assets/${_app_id}"-{rdp,vv}.xml -t \
    "$pkgdir/usr/share/mime/packages/"
  install -Dm644 "$pkgname/assets/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  for i in 128 256; do
    install -Dm644 "$pkgname/assets/icons/hicolor/${i}x${i}/apps/${_app_id}.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done

  for po_file in po/*.po; do
    [ -f "${po_file}" ] || continue
    lang=$(basename "${po_file}" .po)
    install -d "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/$pkgname.mo" "${po_file}"
  done
}
