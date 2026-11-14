# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rustconn
_app_id=io.github.totoshko88.RustConn
pkgver=0.25.0
pkgrel=1
pkgdesc="Modern connection manager for SSH, RDP, VNC, SPICE and more"
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
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
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
  'openh264: H264 decoding for embedded RDP client'
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
sha256sums=('3018e3a54637aca81ba1b1596324c45b88c53f6c00ff404cb318407d8adadabc')

prepare() {
  cd "RustConn-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "RustConn-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export GETTEXT_SYSTEM=true
  export OPENSSL_NO_VENDOR=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cargo build --frozen --release \
    -p "$pkgname" --features adw-1-10,gtk-4-24,vte-0-84,web-embedded \
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
  install -d "$pkgdir/usr/share/applications"
  msgfmt --desktop --template rustconn/assets/${_app_id}.desktop -d po -o \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
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
