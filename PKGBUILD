# Maintainer: Alec Mev <alec@mev.earth>

pkgname=notion-app-nativefier
pkgver=2020.04.05
pkgrel=3
pkgdesc='The all-in-one workspace for your notes, tasks, wikis, and databases'
arch=('any')
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
    -n \
    -f
  curl https://www.notion.so/images/logo-ios.png > "${pkgname}.png"
}

build() {
  cd "${srcdir}"
  nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --maximize \
    --single-instance \
    --verbose \
    https://www.notion.so
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  local _x=`echo "${_name}-linux-"*`
  cp -r "${_x}/resources/app" "${pkgdir}/usr/share/${pkgname}"
  install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_x}/LICENSE"
  install -Dm 644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}
