# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>

pkgname=mcp-manager-bin
pkgver=0.3.15 # renovate: datasource=github-tags depName=Brightwing-Systems-LLC/mcp-manager
pkgrel=1
pkgdesc="Universal MCP server installer and desktop manager"
arch=('x86_64')
url="https://github.com/Brightwing-Systems-LLC/mcp-manager"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('xdg-utils: open external URLs from the desktop environment')
provides=('mcp-manager')
conflicts=('mcp-manager')
options=('!strip')

_tag="v${pkgver}"
_upstream_deb="Brightwing.MCP.Manager_${pkgver}_amd64.deb"

source=(
  "${_upstream_deb}::https://github.com/Brightwing-Systems-LLC/mcp-manager/releases/download/${_tag}/${_upstream_deb}"
  "LICENSE.upstream::https://raw.githubusercontent.com/Brightwing-Systems-LLC/mcp-manager/${_tag}/LICENSE"
)
sha256sums=(
  '2452b7f957da68eeffbf82f6d64a2bafde7cfc2869dfd07d9624a1696203048a'
  'SKIP'
)

package() {
  local _deb_extract_dir="$srcdir/deb-extract"
  local _icon_size

  rm -rf "$_deb_extract_dir"
  mkdir -p "$_deb_extract_dir"

  bsdtar -xf "$srcdir/${_upstream_deb}" -C "$_deb_extract_dir"
  bsdtar -xf "$_deb_extract_dir/data.tar.gz" -C "$_deb_extract_dir"

  install -Dm755 "$_deb_extract_dir/usr/bin/brightwing-mcp-manager" \
    "$pkgdir/usr/bin/brightwing-mcp-manager"
  install -Dm755 "$_deb_extract_dir/usr/bin/bw" \
    "$pkgdir/usr/bin/bw"
  install -Dm755 "$_deb_extract_dir/usr/bin/brightwing-proxy" \
    "$pkgdir/usr/bin/brightwing-proxy"
  install -Dm755 "$_deb_extract_dir/usr/bin/brightwing-authd" \
    "$pkgdir/usr/bin/brightwing-authd"

  install -Dm644 "$_deb_extract_dir/usr/share/applications/Brightwing MCP Manager.desktop" \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"

  for _icon_size in 32x32 192x192 512x512; do
    install -Dm644 "$_deb_extract_dir/usr/share/icons/hicolor/${_icon_size}/apps/brightwing-mcp-manager.png" \
      "$pkgdir/usr/share/icons/hicolor/${_icon_size}/apps/brightwing-mcp-manager.png"
  done

  install -Dm644 "$srcdir/LICENSE.upstream" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  printf '%s\n' \
    'This package repackages the upstream Brightwing MCP Manager Debian release for Arch Linux.' \
    'Upstream project: https://github.com/Brightwing-Systems-LLC/mcp-manager' \
    'Upstream license: MIT' \
    > "$pkgdir/usr/share/licenses/$pkgname/README.Arch"
}
