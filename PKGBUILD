# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rustconn-ru
_pkgname=rustconn
_app_id=io.github.totoshko88.RustConn
pkgver=0.24.10
pkgrel=1
# A new translation of the same pkgver needs a new fork tag and pkgrel.
_tag="v${pkgver}-ru.1"
_srcdir="RustConn-ru-${_tag#v}"
pkgdesc="Modern connection manager for SSH, RDP, VNC, SPICE and more (with Russian localization)"
arch=('x86_64')
url="https://github.com/zbndev/RustConn-ru"
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

provides=("$_pkgname=$pkgver")
conflicts=('rustconn' 'rustconn-appimage' 'rustconn-bin')

source=("RustConn-${_tag#v}.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('0028ec7a1ac74d083e3e59e0c5c5d7944d9ebb1c8db13511e2c7fb33befc963e')

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_srcdir"
  CFLAGS+=" -ffat-lto-objects"
  export GETTEXT_SYSTEM=true
  export OPENSSL_NO_VENDOR=1
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cargo build --frozen --release \
    -p "$_pkgname" --features adw-1-8,gtk-4-22,vte-0-84,web-embedded \
    -p "$_pkgname-cli" --features full
}

check() {
  cd "$_srcdir"
  appstreamcli validate --no-net "$_pkgname/assets/${_app_id}.metainfo.xml"
  desktop-file-validate "$_pkgname/assets/${_app_id}.desktop"
}

package() {
  cd "$_srcdir"
  install -Dm755 target/release/{"$_pkgname","$_pkgname-cli"} -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgname/assets/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 "$_pkgname/assets/${_app_id}.metainfo.xml" -t \
    "$pkgdir/usr/share/metainfo/"
  install -Dm644 "$_pkgname/assets/${_app_id}"-{rdp,vv}.xml -t \
    "$pkgdir/usr/share/mime/packages/"
  install -Dm644 "$_pkgname/assets/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  for i in 128 256; do
    install -Dm644 "$_pkgname/assets/icons/hicolor/${i}x${i}/apps/${_app_id}.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done

  for po_file in po/*.po; do
    [ -f "${po_file}" ] || continue
    lang=$(basename "${po_file}" .po)
    install -d "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/$_pkgname.mo" "${po_file}"
  done
}
