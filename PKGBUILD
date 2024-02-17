# Maintainer: Alec Mev <alec@mev.earth>

pkgname=todoist-nativefier
pkgver=2024.02.17
pkgrel=1
pkgdesc='Todoist in shared Electron runtime'
arch=('x86_64')
url='https://todoist.com'
license=('MIT')
_nativefier=52
_electron=25
depends=("electron${_electron}")
makedepends=(
  'gendesk'
  'yarn'
)
source=("${pkgname}.png::https://d3ptyyxy2at9ui.cloudfront.net/todoist_apple_touch_icon-4b89ad.png")
sha256sums=('355ad7dec904255d24750a22d440b913c971c15be664ec699b1b158dcdcd3bcd')

_name=Todoist

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electron} /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;ProjectManagement" \
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
    "${url}"
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
