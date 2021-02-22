# Maintainer: Alec Mev <alec@mev.earth>

pkgname=notion-app-nativefier
pkgver=2021.02.22
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
  # https://regex101.com/r/FpfTKB/1
  nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --internal-urls '/^(https?:\/\/)?(www\.notion\.so|accounts\.google\.com|appleid\.apple\.com)(\/.*)?$' \
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
