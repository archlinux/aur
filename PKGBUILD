# Maintainer: Kevin <github@kev314.dev>

# Repackages Anthropic's official Claude Desktop .deb (fetched from the official
# apt repo at downloads.claude.ai) into a pacman package. Unlike rebuild-based
# AUR packages, this ships the upstream artifact verbatim, with its own bundled
# Electron and native modules, byte-for-byte identical to what apt installs and
# verified against upstream's own SHA256 checksums.
pkgname=claude-desktop-official-bin
pkgver=1.17377.0
pkgrel=1
pkgdesc="Official Anthropic Claude.ai desktop app, repackaged from the upstream .deb"
arch=('x86_64' 'aarch64')
url="https://claude.ai/download"
license=('LicenseRef-Proprietary')
# Grounded in `readelf -d` on the upstream electron binary (NEEDED libs) plus
# the .deb's own control Depends.
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'at-spi2-core' 'libxkbcommon'
  'libdrm' 'mesa' 'libnotify' 'libsecret' 'libxtst' 'util-linux-libs'
  'xdg-utils' 'xdg-desktop-portal')
# Grounded in the .deb's control Recommends/Suggests and string references in
# the app bundle. The desktop portal backend depends on which DE you run.
optdepends=('xdg-desktop-portal-gtk: portal backend on GNOME and other GTK desktops'
  'xdg-desktop-portal-kde: portal backend on KDE Plasma'
  'libayatana-appindicator: system tray / indicator icon'
  'gnome-keyring: secret storage backend'
  'kwallet: secret storage backend on KDE'
  'gvfs: trash support and file-manager integration'
  'sqlite: project detection (avoids periodic ENOENT log spam)'
  'nodejs: system Node.js for MCP extensions that need a specific version'
  'qemu-base: Cowork sandboxed VM feature'
  'edk2-ovmf: UEFI firmware for the Cowork VM'
  'virtiofsd: shared-folder daemon for the Cowork VM')
provides=("claude-desktop=${pkgver}")
conflicts=('claude-desktop' 'claude-desktop-bin' 'claude-desktop-native'
  'claude-desktop-appimage' 'claude-desktop-hardened-bin')
options=('!strip' 'emptydirs' '!debug')

_repo="https://downloads.claude.ai/claude-desktop/apt/stable/pool/main/c/claude-desktop"
source_x86_64=("claude-desktop-${pkgver}-x86_64.deb::${_repo}/claude-desktop_${pkgver}_amd64.deb")
source_aarch64=("claude-desktop-${pkgver}-aarch64.deb::${_repo}/claude-desktop_${pkgver}_arm64.deb")
sha256sums_x86_64=('563c8df8ee3b957ca234115980386e960007ed8cfc8cc04c77d58a8d43f6c018')
sha256sums_aarch64=('4759acf19b6ac981fbae5cd1c25a828ee9c6e95cfa9ea4cb8c9ccd7c2fc53871')

package() {
  cd "$srcdir"

  case "$CARCH" in
  x86_64) _deb="claude-desktop-${pkgver}-x86_64.deb" ;;
  aarch64) _deb="claude-desktop-${pkgver}-aarch64.deb" ;;
  esac

  # A .deb is an `ar` archive of debian-binary + control.tar.* + data.tar.*.
  # Pull out just the payload and unpack it into the package root, preserving
  # the SUID bit on chrome-sandbox and the /usr/bin -> /usr/lib symlink.
  bsdtar xf "$_deb" data.tar.xz
  bsdtar xpf data.tar.xz -C "$pkgdir"

  # The .deb's postinst is intentionally not replicated: it only does
  # Debian/Ubuntu-specific setup (an AppArmor userns profile and apt-repo
  # registration) that has no effect on Arch.

  # Install the upstream license / copyright for the custom proprietary app.
  install -Dm644 "$pkgdir/usr/share/doc/claude-desktop/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/copyright"

  # Drop Debian-specific packaging cruft that is meaningless on Arch.
  rm -rf "$pkgdir/usr/share/lintian"
}
