# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/mcp-linker-bin

pkgname=mcp-linker-bin
pkgver=2.2.0 # renovate: datasource=github-tags depName=milisp/mcp-linker
pkgrel=2
pkgdesc="Desktop manager for adding and syncing MCP servers across AI clients"
arch=('x86_64')
url="https://github.com/milisp/mcp-linker"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('xdg-utils: open external URLs from the desktop environment')
provides=('mcp-linker')
conflicts=('mcp-linker')
options=('!strip')
_tag="v${pkgver}"
_upstream_name="MCPLinker"
source=(
  "${_upstream_name}_${pkgver}_amd64.deb::https://github.com/milisp/mcp-linker/releases/download/${_tag}/${_upstream_name}_${pkgver}_amd64.deb"
  "mcp-linker-bin.png::https://raw.githubusercontent.com/milisp/mcp-linker/${_tag}/src-tauri/icons/128x128.png"
  "mcp-linker-bin.desktop"
  "LICENSE"
)
sha256sums=(
  'c7a28bfaacccb9fc19f5efdcd947cb5c82953f2f28a6ad2f377322a695adc885'
  '17b717623d714585d43fe064157261bc48f93f48aea176eabdee2cf8905b8ab5'
  'c474269f10d838b1e8b044f124dd9b32199fddef24df811d7a05db331536f834'
  'd505308ce53c54f0e5dc890b85e19182d5c6d60a594de316c24e7a8d29665342'
)

package() {
  local _deb_extract_dir="$srcdir/deb-extract"
  rm -rf "$_deb_extract_dir"
  mkdir -p "$_deb_extract_dir"

  bsdtar -xf "$srcdir/${_upstream_name}_${pkgver}_amd64.deb" -C "$_deb_extract_dir"
  bsdtar -xf "$_deb_extract_dir/data.tar.gz" -C "$_deb_extract_dir"

  install -Dm755 "$_deb_extract_dir/usr/bin/mcp-linker" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/mcp-linker-bin.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/mcp-linker-bin.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  printf '%s\n' \
    'This package repackages the upstream MCP Linker .deb binary for Arch Linux.' \
    'It installs the native dynamic binary instead of the upstream AppImage to avoid Wayland/EGL startup failures.' \
    'Upstream project: https://github.com/milisp/mcp-linker' \
    > "$pkgdir/usr/share/licenses/$pkgname/README.Arch"
}
