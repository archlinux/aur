# Maintainer: Zane Schepke <support@wgtunnel.com>
# pkgver is a placeholder: publish-aur.yml rewrites it (and regenerates checksums via
# updpkgsums) from the release tag before every AUR push.
pkgname=wgtunnel-bin
pkgver=2.5.0
pkgrel=1
install=wgtunnel-bin.install
pkgdesc="An advanced, open-source client for WireGuard and AmneziaWG."
arch=('x86_64')
url="https://wgtunnel.com"
license=('MIT')
depends=('gtk3' 'gcc-libs' 'freetype2' 'fontconfig' 'xdg-desktop-portal-gtk')
optdepends=('systemd: enables automatic daemon startup and management')
provides=("wgtunnel=${pkgver}")
conflicts=('wgtunnel' 'wgtunnel-git')
options=(!strip !emptydirs)

# Nucleus artifact: ${name}-${version}-${os}-${arch}.pacman
_src="wgtunnel-${pkgver}-linux-x64.pacman"
_tag="v2.5.0"
source=("${_src}::https://github.com/wgtunnel/desktop/releases/download/${_tag}/${_src}")
sha256sums=('542660992bde81a2affec27c043fe125f20083f6ea2e90144ce2bf894f83cb4b')

package() {
  bsdtar -x -C "$pkgdir" -f "$srcdir/$_src"
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
