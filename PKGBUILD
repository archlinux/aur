# Maintainer: Zane Schepke <support@wgtunnel.com>
# pkgver is a placeholder: publish-aur.yml rewrites it (and regenerates checksums via
# updpkgsums) from the release tag before every AUR push.
pkgname=wgtunnel-bin
pkgver=2.0.2
pkgrel=1
install=wgtunnel-bin.install
pkgdesc="WireGuard and AmneziaWG VPN client with auto-tunneling, lockdown and proxying"
arch=('x86_64')
url="https://wgtunnel.com"
license=('MIT')
depends=('systemd' 'gtk3' 'libsecret' 'gcc-libs' 'freetype2' 'fontconfig')
provides=("wgtunnel=${pkgver}")
conflicts=('wgtunnel' 'wgtunnel-git')
options=(!strip !emptydirs)

# Nucleus artifact: ${name}-${version}-${os}-${arch}.pacman
_src="wgtunnel-${pkgver}-linux-x64.pacman"
source=("${_src}::https://github.com/wgtunnel/desktop/releases/download/${pkgver}/${_src}")
sha256sums=('05a5ff89c611384152fc1b4f6cddb314b62cf02f35f23194024c8a8876a1c383')

package() {
  bsdtar -x -C "$pkgdir" -f "$srcdir/$_src"
  rm -f "$pkgdir"/.PKGINFO "$pkgdir"/.MTREE "$pkgdir"/.BUILDINFO "$pkgdir"/.INSTALL

  install -d "$pkgdir/usr/bin"
  ln -sf /opt/wgtunnel/bin/wgtunnel "$pkgdir/usr/bin/wgtunnel"

  local unit="$pkgdir/opt/wgtunnel/wgtunnel-daemon.service"
  [[ -f "$unit" ]] || unit="$pkgdir/opt/wgtunnel/lib/wgtunnel-daemon.service"
  install -Dm644 "$unit" "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"
  sed -i 's|^ExecStart=.*|ExecStart=/opt/wgtunnel/bin/wgtunnel-daemon|' \
    "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"
  sed -i 's|^WorkingDirectory=.*|WorkingDirectory=/opt/wgtunnel|' \
    "$pkgdir/usr/lib/systemd/system/wgtunnel-daemon.service"

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
