# Maintainer: Alfredo Ardito <alfredo at ardito dot it>

pkgname=infocamere-sign-desktop-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="InfoCamere Sign Desktop: Italian qualified electronic signature (CAdES/PAdES) with smartcard"
arch=('x86_64')
url="https://id.infocamere.it/download_software.html"
license=('LicenseRef-InfoCamere-EULA')
depends=(
  'pcsclite' 'ccid'
  # Electron frontend
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3' 'libcups'
  'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs'
  'hicolor-icon-theme' 'xdg-utils'
)
makedepends=('python')
optdepends=(
  'bit4id-xpki: Bit4id reader driver for Bit4id readers not covered by ccid, and a system-wide PKCS#11 module'
  'pcsc-tools: pcsc_scan, to check that the reader and card are detected'
  'gnome-shell-extension-appindicator: tray icon on GNOME'
  'libnotify: desktop notifications from the launcher'
)
provides=('infocamere-sign-desktop')
conflicts=('infocamere-sign-desktop')
# The engine is a self-contained bundle (own glibc, Python, OpenSSL):
# stripping or touching its libraries breaks it.
options=('!strip' '!debug')
install=$pkgname.install

# Fix for "signing with 3 or more visible signatures hangs forever":
# raises the engine's WebSocket message limit from 16 MiB to this many MiB
# (about 7 MB per visible signature). Set to 0 to install the app unmodified.
_ws_limit_mib=256

# Upstream reuses the same unversioned URL for every release.
_zip="infocameresign_linux-$pkgver.zip"
source=("$_zip::https://id.infocamere.it/assets/software/infocameresign_linux.zip"
        'infocamere-sign'
        'infocamere-sign-desktop.desktop'
        'fix-ws-limit.py')
noextract=("$_zip")
sha256sums=('165461666b514409f325d3253eee3297a4223adf9c1d79a8a280a54231d7c376'
            '31ffa12c33c4979396bf5eea17c94471b7b4c857d06fbd631bafd17ae0e0e212'
            'e9c1f66f144834a2d0731ae880b83057b268e539b3edc45aa32c4b6f18899213'
            'd73139e0cddd8991428e95c6230379ad6aea91f1db85a0a1b986a2135ab8dd17')

prepare() {
  rm -rf app
  mkdir app
  bsdtar -xf "$_zip" -C app

  # Upstream may publish a new release at the same URL: fail clearly.
  local _ver
  _ver=$(sed -n 's/^ *"version" *: *"\([^"]*\)".*/\1/p' app/etc/configuration.conf | head -n1)
  if [[ "$_ver" != "$pkgver" ]]; then
    error "The downloaded zip contains version $_ver, but this PKGBUILD is for $pkgver."
    error "Please flag the package out of date on the AUR."
    return 1
  fi

  if (( _ws_limit_mib > 0 )); then
    python3 -I fix-ws-limit.py app/lib/python314.zip "$_ws_limit_mib"
  fi
}

package() {
  local _opt="$pkgdir/opt/infocamere-sign-desktop"
  install -d "$_opt"
  cp -a app/bin app/etc app/lib "$_opt/"

  # Upstream ships everything world-writable (0666/0777)
  chmod -R u=rwX,go=rX "$_opt"
  chmod 0755 "$_opt/bin/InfoCamere Sign Desktop Engine.exe" \
             "$_opt/bin/frontend/InfoCamere Sign Desktop.exe" \
             "$_opt/bin/frontend/chrome_crashpad_handler" \
             "$_opt/etc/sign_engine/mutool.exe"

  install -Dm755 infocamere-sign "$pkgdir/usr/bin/infocamere-sign"
  install -Dm644 infocamere-sign-desktop.desktop \
    "$pkgdir/usr/share/applications/infocamere-sign-desktop.desktop"
  install -Dm644 app/infocamere_sign_desktop.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/infocamere-sign-desktop.png"

  local _lic=app/bin/frontend/resources/app.asar.unpacked/dist/firma4-frontend/assets/pdf/license-agreements
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_lic"/license-agreement-*.pdf
  install -Dm644 app/bin/frontend/LICENSE.electron.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}
