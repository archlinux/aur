# Maintainer: Alec Mev <alec@mev.earth>

pkgname=todoist-nativefier
pkgver=2022.12.26
pkgrel=1
pkgdesc='Todoist in shared Electron runtime'
arch=('x86_64')
url='https://todoist.com'
license=('MIT')
_nativefier=50
_electron=19
depends=("electron${_electron}")
makedepends=(
  'curl'
  'gendesk'
  'yarn'
)

_name=Todoist

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electronv} /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;ProjectManagement" \
    -n \
    -f
  curl \
    https://d3ptyyxy2at9ui.cloudfront.net/todoist_apple_touch_icon-4b89ad.png \
    > "${pkgname}.png"
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
    https://todoist.com
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
