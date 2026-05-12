# Maintainer: redlim <yt.redlim@gmail.com>
pkgname=cpro-ngate-beta
pkgver=1.0.20.r379.g35e5b9a
pkgrel=1
pkgdesc="CryptoPro NGate VPN client (beta) — tun daemon, GUI and console frontends"
arch=('x86_64')
url="https://www.cryptopro.ru/"
license=('LicenseRef-CryptoPro')
depends=(
  'glib2'
  'gcc-libs'
  'freetype2'
  'fontconfig'
  'libxcb'
  'libx11'
  'libxdmcp'
  'libxau'
  'hicolor-icon-theme'
)
optdepends=(
  'cprocsp-rdr-gui-64: CryptoPro CSP token/PKCS#11 support'
  'cprocsp-rdr-64: CryptoPro CSP readers'
  'cprocsp-capilite-64: CryptoPro CSP CAPILite'
)
conflicts=('cpro-ngate' 'cprongate-tun' 'cprongate-gui' 'cprongate-console')
provides=('cpro-ngate')
options=('!strip' '!debug')
install="$pkgname.install"

_debver=1.0.20-379-g35e5b9a
_repo=https://ng-client.cryptopro.ru/repository/debian/amd64_beta
source=(
  "$_repo/cprongate-tun_${_debver}_amd64.deb"
  "$_repo/cprongate-gui_${_debver}_amd64.deb"
  "$_repo/cprongate-console_${_debver}_amd64.deb"
  'ngatetun.service'
  'LICENSE'
)
sha256sums=(
  'd85c5d53e3af067665216a0668127423d65d2170a5a126066e57b9dbe4a0c35f'
  '5edd0e28a648caca5e462a43411bc8ff42693763480be9f7538c50659217960a'
  'c4d0b6e9bb82ef273db07df52552eecb4fd0aec4efd4eaf2efcbe1d5ff581c08'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir"
  for _pkg in tun gui console; do
    rm -rf "extract-$_pkg"
    mkdir -p "extract-$_pkg"
    bsdtar -xf "cprongate-${_pkg}_${_debver}_amd64.deb" -C "extract-$_pkg"
    bsdtar -xf "extract-$_pkg/data.tar.xz" -C "extract-$_pkg"
  done
}

package() {
  cd "$srcdir"

  # Merge /opt/cprongate payload from all three debs.
  install -dm755 "$pkgdir/opt/cprongate"
  for _pkg in tun gui console; do
    cp -a "extract-$_pkg/opt/cprongate/." "$pkgdir/opt/cprongate/"
  done

  # Binaries: keep at /opt/cprongate, expose CLIs via /usr/bin symlinks.
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/cprongate/ngateclient        "$pkgdir/usr/bin/ngateclient"
  ln -sf /opt/cprongate/ngateconsoleclient "$pkgdir/usr/bin/ngateconsoleclient"
  ln -sf /opt/cprongate/ngatetun           "$pkgdir/usr/bin/ngatetun"

  # Desktop entry from GUI deb.
  install -Dm644 "extract-gui/usr/share/applications/ngateclient.desktop" \
    "$pkgdir/usr/share/applications/ngateclient.desktop"

  # Icons under hicolor so menus pick them up regardless of .desktop Icon= path.
  install -Dm644 "extract-gui/opt/cprongate/ngate_logo_64x64.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/ngateclient.png"
  install -Dm644 "extract-gui/opt/cprongate/ngate_logo_256x256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/ngateclient.png"

  # Systemd unit replaces the Debian LSB init.d script.
  install -Dm644 "$srcdir/ngatetun.service" \
    "$pkgdir/usr/lib/systemd/system/ngatetun.service"

  # License notice (required for LicenseRef-* identifiers).
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Make sure the binaries are executable.
  chmod 755 "$pkgdir/opt/cprongate/ngatetun" \
            "$pkgdir/opt/cprongate/ngateclient" \
            "$pkgdir/opt/cprongate/ngateconsoleclient"
}
