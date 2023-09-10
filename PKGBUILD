# Maintainer: Alec Mev <alec@mev.earth>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=gmail-desktop
_ver=3.0.0-alpha.37
pkgver="${_ver//-/_}"
pkgrel=1
pkgdesc='Nifty Gmail desktop app'
arch=('x86_64')
url='https://github.com/timche/gmail-desktop/tree/develop'
license=('MIT')
_electronv=21 # https://github.com/timche/gmail-desktop/issues/385#issuecomment-1634102694
depends=("electron${_electronv}")
makedepends=(
  'gendesk'
  'npm'
)
optdepends=(
  'libnotify: Desktop notifications'
  'libappindicator-gtk3: Tray icon'
)
_dir="${pkgname}-${_ver}"
source=("${_dir}.tar.gz::https://github.com/timche/gmail-desktop/archive/refs/tags/v${_ver}.tar.gz")
sha256sums=('f6edd6bc221ca57a98bb5a551266f040b3158b1a6aac4ab17111c78edcf2a24c')

prepare() {
  cd "${_dir}"
  sed -i '/husky/d' package.json
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electronv} /usr/share/${pkgname}/app.asar "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name 'Gmail Desktop' \
    --categories 'Network;Office;Email' \
    -n \
    -f
}

build() {
  cd "${_dir}"
  npm i
  npm run build
  npx electron-builder \
    --linux \
    --dir \
    -c.electronDist="/usr/lib/electron${_electronv}" \
    -c.electronVersion="$(cat "/usr/lib/electron${_electronv}/version")"
}

package() {
  cd "${_dir}"
  mkdir -p "${pkgdir}/usr/share"
  cp -r dist/linux-unpacked/resources "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" build/icon.png
}
