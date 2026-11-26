# Maintainer: Renan BS <renan.biegel@gmail.com>
pkgname=orca-ade-bin
pkgver=1.4.277
pkgrel=1
pkgdesc='Next-gen IDE for parallel agentic development'
arch=('x86_64' 'aarch64')
url='https://onorca.dev/'
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
  'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret'
  'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango'
  'python' 'python-gobject' 'systemd-libs' 'util-linux-libs' 'xclip'
  'xdg-utils' 'xdotool' 'xorg-server-xvfb'
)
optdepends=(
  'libappindicator-gtk3: system tray indicator'
  'vulkan-icd-loader: Vulkan backend for GPU-backed features'
)
makedepends=('libarchive')
provides=("orca-ide=${pkgver}")
conflicts=('orca-ide' 'orca-ide-bin' 'onorca-bin' 'stably-orca' 'stably-orca-bin' 'stably-orca-git')
options=('!strip' '!debug')

# Upstream ships a self-contained Electron runtime in /opt/Orca, so the package
# never depends on an extra/electronNN version and native modules always match.
_upstream='https://github.com/stablyai/orca'
_debrel="${_upstream}/releases/download/v${pkgver}"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/stablyai/orca/v${pkgver}/LICENSE")
source_x86_64=("${_debrel}/orca-ide_${pkgver}_amd64.deb")
source_aarch64=("${_debrel}/orca-ide_${pkgver}_arm64.deb")
sha512sums=('faaf3b47b8ad4018071f90277e350ec5a6f393f0b43cf7f8d8ce94ac5553a57c94476ed282491e6899da0543fcdecd08598931e3ef1bb06ca8aaa388da13e70f')
sha512sums_x86_64=('78ca07b7793c99dba1c915c24db58a5b63d08696751e919b7d930a9098f7cb51348f12d4322d0cf538a27a39eaecf92e38d0b07888d5645aaf70f409b1dfb54f')
sha512sums_aarch64=('efc4fb0fea078264f2d340104271efc226836bc07c58fceb55039519f115753d3497009302192c055d60f3ab9f42212d59344b1f812d600d3fc152c3bfecb552')

_debname() {
  case $CARCH in
    x86_64)  echo "orca-ide_${pkgver}_amd64.deb" ;;
    aarch64) echo "orca-ide_${pkgver}_arm64.deb" ;;
    *) return 1 ;;
  esac
}

prepare() {
  # The .deb is an ar archive; unpack only the payload, not Debian metadata.
  bsdtar --no-same-owner -xf "$(_debname)" data.tar.xz
}

check() {
  local list entry
  list=$(bsdtar -tf data.tar.xz)
  for entry in \
    ./opt/Orca/orca-ide \
    ./opt/Orca/chrome-sandbox \
    ./opt/Orca/resources/app.asar \
    ./opt/Orca/resources/bin/orca-ide \
    ./usr/share/applications/orca-ide.desktop \
    ./usr/share/icons/hicolor/512x512/apps/orca-ide.png
  do
    grep -qxF -- "$entry" <<<"$list" || {
      echo "upstream layout changed: ${entry} is gone" >&2
      return 1
    }
  done
  # The launcher must use the bundled runtime, not a system Electron.
  bsdtar -xOf data.tar.xz ./usr/share/applications/orca-ide.desktop |
    grep -qF 'Exec=/opt/Orca/orca-ide'
}

package() {
  bsdtar --no-same-owner -xf data.tar.xz -C "$pkgdir"

  # Upstream postinst: the CLI shim resolves the app from its own path, so the
  # symlink is all it needs; chrome-sandbox stays setuid for hosts without
  # unprivileged user namespaces.
  chmod 4755 "$pkgdir/opt/Orca/chrome-sandbox"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Orca/resources/bin/orca-ide "$pkgdir/usr/bin/orca-ide"

  # Themes that ship an `orca` icon (Tela, for the GNOME screen reader) win the
  # lookup for `orca-ide`: KDE drops the `-ide` suffix and returns the
  # accessibility glyph. An underscore never collides with a theme icon name.
  local icon
  for icon in "$pkgdir"/usr/share/icons/hicolor/*/apps/orca-ide.png; do
    mv -- "$icon" "${icon%orca-ide.png}orca_ide.png"
  done
  sed -i 's/^Icon=orca-ide$/Icon=orca_ide/' \
    "$pkgdir/usr/share/applications/orca-ide.desktop"
  grep -qx 'Icon=orca_ide' "$pkgdir/usr/share/applications/orca-ide.desktop" ||
    { echo "error: upstream desktop entry no longer carries Icon=orca-ide" >&2; return 1; }

  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Debian changelog; upstream's release notes live on GitHub.
  rm -rf "$pkgdir/usr/share/doc"
}
