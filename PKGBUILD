# Maintainer: Alec Mev <alec@mev.earth>

_name=gmail-desktop
pkgname="${_name}-dev"
_ver=3.0.0-alpha.34
pkgver="${_ver//-/_}"
_namever="${_name}-${_ver}"
pkgrel=1
pkgdesc='Nifty Gmail desktop app'
arch=('x86_64')
url='https://github.com/timche/gmail-desktop/tree/develop'
license=('MIT')
_electronv=19
depends=("electron${_electronv}")
makedepends=(
  'gendesk'
  'npm'
)
optdepends=('libappindicator-gtk3: Tray icon')
conflicts=('gmail-desktop')
source=("${_namever}.tar.gz::https://github.com/timche/gmail-desktop/archive/refs/tags/v${_ver}.tar.gz")
sha256sums=('d9fcc89e79b1ad5ee091adef8c6ff4284583db09c3e18e7284fe8c57a5d0e2cf')

prepare() {
  cd "${_namever}"
  # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gmail-desktop&id=7e3912df588282beea9010d71dcfea457658f91c#n24
  sed -i '/husky/d' package.json
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electronv} /usr/share/${pkgname}/app.asar "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "Gmail Desktop" \
    --categories "Network;Office;Email" \
    -n \
    -f
}

build() {
  cd "${_namever}"
  # https://github.com/electron-userland/electron-builder/issues/5668
  npm i electron-builder@22
  npm run build
  local _electronDist="/usr/lib/electron${_electronv}"
  local _electronVersion=`cat "${_electronDist}/version"`
  npm run dist:linux -- \
    --dir \
    -c.electronDist="${_electronDist}" \
    -c.electronVersion="${_electronVersion}"
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
