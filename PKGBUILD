# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/mcp-manager-bin

pkgname=mcp-manager-bin
pkgver=0.3.15 # renovate: datasource=github-tags depName=Brightwing-Systems-LLC/mcp-manager extractVersion=^v?(?<version>.*)$
pkgrel=4
pkgdesc="MCP Manager desktop application with Claude Code integration"
arch=('x86_64')
url="https://github.com/Brightwing-Systems-LLC/mcp-manager"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('xdg-utils: open external URLs from the desktop environment')
provides=('mcp-manager')
conflicts=('mcp-manager')
options=('!strip')
_tag="v${pkgver}"
_upstream_name="Brightwing.MCP.Manager"
_pkgbase="mcp-manager"
source=(
  "${_upstream_name}_${pkgver}_amd64.deb::https://github.com/Brightwing-Systems-LLC/mcp-manager/releases/download/${_tag}/${_upstream_name}_${pkgver}_amd64.deb"
  "${_pkgbase}-bin.desktop"
  "LICENSE::https://raw.githubusercontent.com/Brightwing-Systems-LLC/mcp-manager/${_tag}/LICENSE"
)
sha256sums=('2452b7f957da68eeffbf82f6d64a2bafde7cfc2869dfd07d9624a1696203048a'
            '7ae01cdfc0b6af9dc6284a6975f3243d2682d688122cb7cd6440faf232ff7d1f'
            '67dbbe39a64087c5a3d3db93b056389b113e5368818f425097811a9dacc467c8')

package() {
  local _deb_extract_dir="$srcdir/deb-extract"
  rm -rf "$_deb_extract_dir"
  mkdir -p "$_deb_extract_dir"

  bsdtar -xf "$srcdir/${_upstream_name}_${pkgver}_amd64.deb" -C "$_deb_extract_dir"
  bsdtar -xf "$_deb_extract_dir/data.tar.gz" -C "$_deb_extract_dir"

  install -Dm755 "$_deb_extract_dir/usr/bin/${_pkgbase}" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/${_pkgbase}-bin.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  for size in 32x32 128x128 256x256; do
    local icon_dir="$pkgdir/usr/share/icons/hicolor/$size/apps"
    install -Dm644 "$_deb_extract_dir/usr/share/icons/hicolor/$size/apps/${_pkgbase}.png" \
      "$icon_dir/$pkgname.png"
  done

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _deb_desktop="$_deb_extract_dir/usr/share/applications/${_pkgbase}.desktop"
  if [[ -f "$_deb_desktop" ]]; then
    sed -e "s|^Exec=.*|Exec=/$pkgname|" \
        -e "s|^Icon=.*|Icon=$pkgname|" \
        "$_deb_desktop" > "$pkgdir/usr/share/applications/$pkgname.desktop"
  fi

  printf '%s\n' \
    'This package repackages the upstream MCP Manager .deb binary for Arch Linux.' \
    'It installs the native dynamic binary instead of the upstream AppImage to avoid Wayland/EGL startup failures.' \
    'Upstream project: https://github.com/Brightwing-Systems-LLC/mcp-manager' \
    > "$pkgdir/usr/share/licenses/$pkgname/README.Arch"
}
