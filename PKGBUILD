# Maintainer: Alec Mev <alec@mev.earth>
# Contributor: akaessens

pkgname=google-calendar-nativefier
pkgver=2024.02.19
pkgrel=1
pkgdesc='Google Calendar in shared Electron runtime'
arch=('x86_64')
url='https://calendar.google.com'
license=('MIT')
_nativefier=52
_electron=28
depends=("electron${_electron}")
makedepends=(
  'gendesk'
  'yarn'
)
source=("${pkgname}.png::https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Calendar_icon_%282020%29.svg/512px-Google_Calendar_icon_%282020%29.svg.png")
sha256sums=('SKIP') # Wiki doesn't have a stable URL for the latest edition

_name='Google Calendar'

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electron} /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;Calendar" \
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
  local _x=`echo "${_name// /}-linux-"*`
  cp -r "${_x}/resources/app" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_x}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}
