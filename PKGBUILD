# Maintainer: Pakrohk <https://github.com/pakrohk>

pkgname=nova-client-bin
_pkgname=nova-client
_appid=online.novaproxy.nova_client
# Use the distribution's Xray instead of the bundled copy. The bundled binary is
# stock Xray-core and Nova only runs it for xhttp. Set to 0 to ship the bundled one.
_system_xray=1
pkgver=1.34.1
pkgrel=1
pkgdesc='Nova Client, a Flutter proxy/VPN client built on sing-box, Xray, Psiphon, MasterDNS and WARP'
arch=('x86_64')
url='https://github.com/IRNova/Nova-Client'
# Nova itself: MIT. psiphon-linux-amd64: GPL-3.0 (license file ships in the tarball).
# MasterDNS: MIT. The tarball ships no license file for sing-box or Xray; review before submitting.
license=('MIT' 'GPL-3.0-only')
# Everything the GUI links against comes from the Arch repos, and every library
# it links directly is listed (namcap: "implicitly satisfied"). What stays
# bundled has no Arch package or is tied to this exact build: the Flutter engine
# and plugins, libaether, libcronet, the Nova fork of sing-box, psiphon, masterdns.
depends=('glibc' 'libgcc' 'libstdc++'
         'gtk3' 'glib2' 'cairo' 'pango' 'harfbuzz' 'fontconfig' 'libepoxy'
         'at-spi2-core' 'gdk-pixbuf2' 'hicolor-icon-theme'
         'libsecret'
         'libayatana-appindicator' 'libayatana-indicator' 'ayatana-ido' 'libdbusmenu-glib')
if (( _system_xray )); then
  depends+=('xray')
fi
optdepends=('polkit: full-device (TUN) mode, started through pkexec'
            'gnome-shell-extension-appindicator: system tray icon on GNOME')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('patchelf')
# Prebuilt Go/Rust/Flutter binaries: automatic stripping stays off (it could break
# the Dart snapshot); the few files that ship with symbols are stripped by hand.
options=('!strip' '!debug')
noextract=("$_pkgname-$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/Nova-Linux.tar.gz"
        "$_pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/IRNova/Nova-Client/v$pkgver/LICENSE"
        "$_appid.desktop")
sha256sums=('8be86aee572020f669abe01abfcaa54df30de4acacf26ace85515fc6c9bbebc3'
            'c99c6d75494458d52a049db0898c204eaa525346da1a8e13b260fb369f344ad0'
            '0b2ccf4d89dcad6cd8fed4b0fcbae24975933449e6944a79f166601252dae890')

package() {
  # The app finds its cores and libaether.so next to its own executable and
  # resolves everything relative to it, so the tree stays together in one
  # private directory under /usr/lib.
  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  bsdtar -xf "$srcdir/$_pkgname-$pkgver.tar.gz" -C "$pkgdir/usr/lib/$_pkgname" --no-same-owner

  # Upstream CI leaked its build directory into the plugins' RUNPATH (namcap:
  # "Insecure RUNPATH"). The plugins only need libflutter_linux_gtk.so, which
  # sits next to them, so point RUNPATH at their own directory.
  local f rpath
  for f in "$pkgdir/usr/lib/$_pkgname"/lib/*.so; do
    rpath=$(patchelf --print-rpath "$f")   # fails loudly if patchelf is missing
    case "$rpath" in
      /home/*) patchelf --set-rpath '$ORIGIN' "$f" ;;
    esac
  done

  # namcap: "unstripped" ELF files. Strip only what upstream shipped with
  # symbols; libapp.so (Dart AOT snapshot) and the Flutter engine stay untouched.
  strip --strip-unneeded \
    "$pkgdir/usr/lib/$_pkgname"/lib/lib*_plugin.so \
    "$pkgdir/usr/lib/$_pkgname/lib/libdartjni.so" \
    "$pkgdir/usr/lib/$_pkgname/libcronet.so"
  strip --strip-all "$pkgdir/usr/lib/$_pkgname/nova_client"

  # The app looks for xray-linux-amd64 next to itself; point that name at the
  # packaged Xray so it is updated through pacman.
  if (( _system_xray )); then
    ln -sf /usr/bin/xray "$pkgdir/usr/lib/$_pkgname/xray-linux-amd64"
  fi

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/nova_client" "$pkgdir/usr/bin/$_pkgname"

  # Desktop file is named after the GTK application id so Wayland compositors match it.
  install -Dm644 "$srcdir/$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"
  install -Dm644 "$pkgdir/usr/lib/$_pkgname/data/flutter_assets/assets/brand/nova-logo-tile.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  install -Dm644 "$srcdir/$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgdir/usr/lib/$_pkgname/LICENSE-psiphon.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-psiphon.txt"
  install -Dm644 "$pkgdir/usr/lib/$_pkgname/LICENSE-masterdns.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-masterdns.txt"
}
