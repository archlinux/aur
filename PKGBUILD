# Maintainer: Alec Mev <alec@mev.earth>

_name=gmail-desktop
pkgname="${_name}-dev"
_ver=3.0.0-alpha.27
pkgver="${_ver//-/_}"
_namever="${_name}-${_ver}"
pkgrel=1
pkgdesc='Nifty Gmail desktop app for macOS, Linux & Windows'
arch=('x86_64')
url='https://github.com/timche/gmail-desktop/tree/develop'
license=('MIT')
depends=('electron')
makedepends=(
  'gendesk'
  'yarn'
)
optdepends=('libappindicator-gtk3: Tray icon')
source=(
  "${_namever}.tar.gz::https://github.com/timche/gmail-desktop/archive/refs/tags/v${_ver}.tar.gz"
  "${_namever}-menu.patch::https://github.com/alecmev/gmail-desktop/commit/fix-auto-hide-menu.patch"
  "${_namever}-mailto.patch::https://github.com/alecmev/gmail-desktop/commit/handle-mailto-in-argv.patch"
)
sha256sums=('36224d2b745697157a96dd68d85568c3c7ee4178061c05dc97e9d107718f5ac0'
            'b7a1be78ccbe43f22d98d16942ef850bb99d1e40162752874606cdcca71042dc'
            'e7946761a5d688d13cb700ea58ab129116f6d3a98e862b64a9fa83f9084f57fe')

prepare() {
  cd "${_namever}"
  # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gmail-desktop&id=7e3912df588282beea9010d71dcfea457658f91c#n24
  sed -i '/husky/d' package.json
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron /usr/share/${pkgname}/app.asar "\$@"
EOF
  # %u is where "mailto:" goes
  # https://github.com/xyproto/gendesk/issues/19
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "Gmail Desktop" \
    --categories "Network;Office;Email" \
    --exec "${pkgname} %u" \
    -n \
    -f
  patch --strip=1 --input="${srcdir}/${_namever}-menu.patch"
  patch --strip=1 --input="${srcdir}/${_namever}-mailto.patch"
}

build() {
  cd "${_namever}"
  yarn
  # Latest Electron, because we'll be running it with latest Electron
  # Latest Electron Builder, because https://github.com/electron-userland/electron-builder/issues/5668
  yarn add --dev electron electron-builder
  yarn build
  yarn electron-builder --linux dir
}

package() {
  cd "${_namever}"
  mkdir -p "${pkgdir}/usr/share"
  cp -r "dist/linux-unpacked/resources" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" build/icon.png
}
