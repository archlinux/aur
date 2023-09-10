# Maintainer: Alec Mev <alec@mev.earth>

pkgname=notion-app-nativefier
pkgver=2023.09.10
pkgrel=1
pkgdesc='Notion in shared Electron runtime'
arch=('x86_64')
url='https://www.notion.so'
license=('MIT')
_nativefier=52
_electron=25
depends=("electron${_electron}")
makedepends=(
  'gendesk'
  'yarn'
)
source=("${pkgname}.png::https://www.notion.so/images/logo-ios.png")
sha256sums=('c97a529a23f7984939940f0e78ad16b25e466d603fe8601f6538819142d4fd46')

_name=Notion

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electron} /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;ProjectManagement;Utility;TextTools" \
    -n \
    -f
}

build() {
  cd "${srcdir}"
  yarn add "nativefier@${_nativefier}"
  yarn nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --maximize \
    --user-agent safari \
    --single-instance \
    --verbose \
    https://www.notion.so
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  local _x=`echo "${_name}-linux-"*`
  cp -r "${_x}/resources/app" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_x}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}
