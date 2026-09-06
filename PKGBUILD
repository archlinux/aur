# Maintainer: 5p00kyy <admin@5p00ky.dev>

pkgname=openclaw-desktop
pkgver=2026.9.2
pkgrel=1
pkgdesc='OpenClaw Linux desktop companion'
arch=('x86_64')
url='https://github.com/openclaw/openclaw'
license=('MIT')
depends=(
  'bash'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'pkgconf'
  'rust'
)
checkdepends=(
  'at-spi2-core'
  'nodejs'
  'python-gobject'
  'xorg-server-xvfb'
  'xorg-xauth'
)
optdepends=(
  'openclaw: use a system CLI instead of the companion-managed CLI for local Gateway setup'
  'openssh: connect to a remote Gateway through an SSH tunnel'
)
conflicts=('openclaw-desktop-bin')
replaces=('openclaw-desktop-bin')
options=('!lto')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'OpenClaw.desktop'
  'tests-first-run-remote.py'
)
sha256sums=(
  '81c80f5c1e8512ac41149a0f3bc16364213cb34737d737debaa3937eace66ae6'
  '489f3cfab1d78498feba72e1ebaec6accc17ff9ba0591cde488df24ae5657473'
  '32556a5dcd569e681e183856299b1a6b6a1c744c5d797e8f5667b7005db6b463'
)

prepare() {
  cd "openclaw-${pkgver}"

  # Upstream keeps 0.1.0 as a development placeholder and stamps release
  # bundles in CI. Require that exact input before applying the tagged version.
  grep -qx 'version = "0.1.0"' apps/linux/src-tauri/Cargo.toml
  grep -A1 -x 'name = "openclaw-desktop-linux"' apps/linux/src-tauri/Cargo.lock \
    | grep -qx 'version = "0.1.0"'
  grep -qx '  "version": "0.1.0",' apps/linux/src-tauri/tauri.conf.json

  sed -i "0,/^version = \"0.1.0\"$/s//version = \"${pkgver}\"/" \
    apps/linux/src-tauri/Cargo.toml
  sed -i "/^name = \"openclaw-desktop-linux\"$/{n;s/^version = \"0.1.0\"$/version = \"${pkgver}\"/;}" \
    apps/linux/src-tauri/Cargo.lock
  sed -i "0,/^  \"version\": \"0.1.0\",$/s//  \"version\": \"${pkgver}\",/" \
    apps/linux/src-tauri/tauri.conf.json

  grep -qx "version = \"${pkgver}\"" apps/linux/src-tauri/Cargo.toml
  grep -A1 -x 'name = "openclaw-desktop-linux"' apps/linux/src-tauri/Cargo.lock \
    | grep -qx "version = \"${pkgver}\""
  grep -qx "  \"version\": \"${pkgver}\"," apps/linux/src-tauri/tauri.conf.json

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --manifest-path apps/linux/src-tauri/Cargo.toml
}

build() {
  cd "openclaw-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  export CARGO_NET_OFFLINE=true
  cargo build --frozen --release --manifest-path apps/linux/src-tauri/Cargo.toml
}

check() {
  cd "openclaw-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"
  export CARGO_NET_OFFLINE=true

  cargo test --frozen --release --all-targets \
    --manifest-path apps/linux/src-tauri/Cargo.toml
  xvfb-run -a -s '-screen 0 1280x1024x24' dbus-run-session -- \
    /usr/bin/python "${srcdir}/tests-first-run-remote.py" \
    "${srcdir}/target/release/openclaw-desktop"
}

package() {
  cd "openclaw-${pkgver}"

  install -Dm755 "${srcdir}/target/release/openclaw-desktop" \
    "${pkgdir}/usr/bin/openclaw-desktop"
  install -Dm755 scripts/install-cli.sh \
    "${pkgdir}/usr/lib/OpenClaw/install-cli.sh"
  install -Dm644 "${srcdir}/OpenClaw.desktop" \
    "${pkgdir}/usr/share/applications/OpenClaw.desktop"

  install -Dm644 apps/linux/src-tauri/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/openclaw-desktop.png"
  install -Dm644 apps/linux/src-tauri/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openclaw-desktop.png"
  install -Dm644 apps/linux/src-tauri/icons/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/openclaw-desktop.png"
  install -Dm644 apps/linux/src-tauri/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openclaw-desktop.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
