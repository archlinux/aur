# Maintainer: Alec Mev <alec@mev.earth>

pkgname=notion-app-nativefier
pkgver=2021.04.26
pkgrel=1
pkgdesc='Notion in shared Electron runtime'
arch=('x86_64')
url='https://www.notion.so'
license=('MIT')
depends=('electron')
makedepends=(
  'curl'
  'gendesk'
  'nodejs-nativefier'
)

_name=Notion

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;ProjectManagement;Utility;TextTools;" \
    -n \
    -f
  curl https://www.notion.so/images/logo-ios.png > "${pkgname}.png"
}

build() {
  cd "${srcdir}"
  # https://github.com/nativefier/nativefier/issues/831
  nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --maximize \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0" \
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
