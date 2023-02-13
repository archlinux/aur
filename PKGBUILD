# Maintainer: Ghassan Alduraibi <git@ghassan.dev>
# Contributor: akaessens

pkgname=google-calendar-nativefier-dark
pkgver=2023.02.13
pkgrel=1
pkgdesc='Google Calendar in shared Electron runtime with dark theme (by pyxelr)'
arch=('x86_64')
url='https://calendar.google.com'
license=('MIT')
_nativefier=50
_electron=19
depends=("electron${_electron}")
makedepends=(
  'curl'
  'gendesk'
  'yarn'
)
source=("${pkgname}.js")
sha256sums=('866be0e5f2ba37c0256530568c18c01ac9fcba25d5037c9f0be5b415be6506e9')

_name='Google Calendar Dark'

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electronv} /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;Calendar" \
    -n \
    -f
  curl \
    https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Calendar_icon_%282020%29.svg/512px-Google_Calendar_icon_%282020%29.svg.png \
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
    --inject "${pkgname}.js" \
    https://calendar.google.com
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

