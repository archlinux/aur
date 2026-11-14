# Maintainer: Pakrohk <https://github.com/pakrohk>

pkgname=nova-client-bin
_pkgname=nova-client
_appid=online.novaproxy.nova_client
# Use the distribution's Xray instead of the bundled copy. The bundled binary is
# stock Xray-core and Nova only runs it for xhttp. Set to 0 to ship the bundled one.
_system_xray=1
# pkgver: Arch-compliant form (no dashes allowed).
# _tag:   the actual upstream release tag on GitHub (used only for the tarball URL).
#         For v1.34.1-build276 upstream: pkgver=1.34.1.b276, _tag=1.34.1-build276.
pkgver=1.34.2.b285
_tag=1.34.2-build285
pkgrel=1
pkgdesc='Nova Client, a Flutter proxy/VPN client built on sing-box, Xray, Psiphon, MasterDNS and WARP'
arch=('x86_64')
url='https://github.com/IRNova/Nova-Client'
license=('MIT' 'GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++'
         'gtk3' 'glib2' 'cairo' 'pango' 'harfbuzz' 'fontconfig' 'libepoxy'
         'at-spi2-core' 'gdk-pixbuf2' 'hicolor-icon-theme'
         'libsecret'
         'libayatana-appindicator' 'libayatana-indicator' 'ayatana-ido' 'libdbusmenu-glib'
         'python')
if (( _system_xray )); then
  depends+=('xray')
fi
optdepends=('polkit: full-device (TUN) mode, started through pkexec'
            'gnome-shell-extension-appindicator: system tray icon on GNOME')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('patchelf')
options=('!strip' '!debug')
noextract=("$_pkgname-$pkgver.tar.gz")
# The LICENSE is a LOCAL file kept in the AUR repo next to PKGBUILD. This avoids
# depending on raw.githubusercontent.com (often unreachable from some networks)
# and lets end users get it from the AUR server itself. update.sh refreshes it
# whenever pkgver/_tag changes.
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$_tag/Nova-Linux.tar.gz"
        "LICENSE"
        "$_appid.desktop")
# Filled by updpkgsums (or ./update.sh).
sha256sums=('464bf6abbc12d7e048c2721cb6a48386c9d95eb9fe475cba8a89b6c3e42d0410'
            'c99c6d75494458d52a049db0898c204eaa525346da1a8e13b260fb369f344ad0'
            '0b2ccf4d89dcad6cd8fed4b0fcbae24975933449e6944a79f166601252dae890')

package() {
  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  bsdtar -xf "$srcdir/$_pkgname-$pkgver.tar.gz" -C "$pkgdir/usr/lib/$_pkgname" --no-same-owner

  local f rpath
  for f in "$pkgdir/usr/lib/$_pkgname"/lib/*.so; do
    rpath=$(patchelf --print-rpath "$f")
    case "$rpath" in
      /home/*) patchelf --set-rpath '$ORIGIN' "$f" ;;
    esac
  done

  strip --strip-unneeded \
    "$pkgdir/usr/lib/$_pkgname"/lib/lib*_plugin.so \
    "$pkgdir/usr/lib/$_pkgname/lib/libdartjni.so" \
    "$pkgdir/usr/lib/$_pkgname/libcronet.so"
  strip --strip-all "$pkgdir/usr/lib/$_pkgname/nova_client"

  if (( _system_xray )); then
    ln -sf /usr/bin/xray "$pkgdir/usr/lib/$_pkgname/xray-linux-amd64"
  fi

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/nova_client" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"
  install -Dm644 "$pkgdir/usr/lib/$_pkgname/data/flutter_assets/assets/brand/nova-logo-tile.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/usr/lib/$_pkgname/LICENSE-psiphon.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-psiphon.txt"
  install -Dm644 "$pkgdir/usr/lib/$_pkgname/LICENSE-masterdns.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-masterdns.txt"
}
