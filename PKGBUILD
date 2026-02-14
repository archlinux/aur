# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rustconn
_app_id=io.github.totoshko88.RustConn
pkgver=0.8.3
pkgrel=2
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
  'vte4'
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
  'freerdp: RDP client'
  'google-cloud-cli: Google Cloud CLI'
  'gtk-vnc: VNC Client'
  'keepassxc: Password storage method option'
  'libsecret: Fallback password storage method'
  'oci-cli: OCI CLI'
  'passbolt-cli: Password storage method option'
  'spice-gtk: SPICE Client'  ## not found, using embedded
  'tailscale: Tailscale CLI'
  'teleport: Teleport CLI'
  'tigervnc'
  'virt-viewer'
)
source=("RustConn-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee4ce4958fd58ab722653b6f821ee36deb7f937e0ce800155d3bcdafe3475300')

prepare() {
  cd "RustConn-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "RustConn-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "RustConn-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen

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
  install -Dm644 "$pkgname/assets/icons/hicolor/scalable/apps/${_app_id}.svg" -t \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  for i in 48 64 128 256; do
    install -Dm644 "$pkgname/assets/icons/hicolor/${i}x${i}/apps/${_app_id}.png" -t \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/"
  done
}
