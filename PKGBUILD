# Maintainer: Zane Schepke <support@wgtunnel.com>
# pkgver is a placeholder: publish-aur.yml rewrites it (and regenerates checksums via
# updpkgsums) from the release tag before every AUR push.
pkgname=wgtunnel-bin
pkgver=2.5.1
pkgrel=1
install=wgtunnel-bin.install
pkgdesc="An advanced, open-source client for WireGuard and AmneziaWG."
arch=('x86_64' 'aarch64')
url="https://wgtunnel.com"
license=('MIT')
depends=('gtk3' 'gcc-libs' 'freetype2' 'fontconfig' 'xdg-desktop-portal-gtk')
optdepends=('systemd: enables automatic daemon startup and management')
provides=("wgtunnel=${pkgver}")
conflicts=('wgtunnel' 'wgtunnel-git')
options=(!strip !emptydirs)

# Nucleus artifact: ${name}-${version}-${os}-${arch}.pacman
_src_x86_64="wgtunnel-${pkgver}-linux-x64.pacman"
_src_aarch64="wgtunnel-${pkgver}-linux-aarch64.pacman"
_tag="v2.5.1"
source_x86_64=("${_src_x86_64}::https://github.com/wgtunnel/desktop/releases/download/${_tag}/${_src_x86_64}")
source_aarch64=("${_src_aarch64}::https://github.com/wgtunnel/desktop/releases/download/${_tag}/${_src_aarch64}")
sha256sums_x86_64=('2582efd8708a7db28b46ac96fdbad972b5ea6dbf6cb684c771216cb973952ddb')
sha256sums_aarch64=('efa5ef0f1536704c855449f315dd9ce01bede1a8655c4aab17fd7e14f4467ab7')

package() {
  local _src="_src_${CARCH}"
  bsdtar -x -C "$pkgdir" -f "$srcdir/${!_src}"
  rm -f "$pkgdir"/.PKGINFO "$pkgdir"/.MTREE "$pkgdir"/.BUILDINFO "$pkgdir"/.INSTALL

  install -d "$pkgdir/usr/bin"
  ln -sf /opt/wgtunnel/wgtunnel "$pkgdir/usr/bin/wgtunnel"

  local unit="$pkgdir/opt/wgtunnel/wgtunnel-daemon.service"
  [[ -f "$unit" ]] || unit="$pkgdir/opt/wgtunnel/lib/wgtunnel-daemon.service"
  install -Dm644 "$unit" "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"
  sed -i 's|^ExecStart=.*|ExecStart=/opt/wgtunnel/bin/wgtunnel-daemon|' \
    "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"
  sed -i 's|^WorkingDirectory=.*|WorkingDirectory=/opt/wgtunnel|' \
    "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"

  # Pulled in by the daemon unit, so it needs no enabling.
  local early="$pkgdir/opt/wgtunnel/wgtunnel-early-boot.service"
  [[ -f "$early" ]] || early="$pkgdir/opt/wgtunnel/lib/wgtunnel-early-boot.service"
  if [[ -f "$early" ]]; then
    install -Dm644 "$early" "$pkgdir/usr/lib/systemd/system/wgtunnel-early-boot.service"
    sed -i 's|^ExecStart=.*|ExecStart=/opt/wgtunnel/bin/wgtunnel-daemon --early-boot-firewall|' \
      "$pkgdir/usr/lib/systemd/system/wgtunnel-early-boot.service"
  fi

  if ! compgen -G "$pkgdir/usr/share/applications/*.desktop" >/dev/null; then
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/com.zaneschepke.wireguardautotunnel.wgtunnel.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=WG Tunnel
Exec=wgtunnel
Icon=wgtunnel
Categories=Network;Security;Settings;Utility;
Terminal=false
EOF
  fi
}
