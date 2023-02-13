# Maintainer: Ghassan Alduraibi <git@ghassan.dev>
# Contributor: akaessens

pkgname=google-calendar-nativefier-dark
pkgver=2023.02.13
pkgrel=2
pkgdesc='Google Calendar in shared Electron runtime with dark theme (by pyxelr)'
arch=('x86_64')
url='https://calendar.google.com'
license=('MIT')
depends=("electron")
makedepends=(
  'curl'
  'gendesk'
  'nodejs-nativefier'
)

_name='Google Calendar Dark'

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron /usr/share/${pkgname} "\$@"
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
  curl \
    https://raw.githubusercontent.com/pyxelr/dark-google-calendar/master/Google-DarkCalendar.user.css \
    > "${pkgname}.css"
}

build() {
  cd "${srcdir}"
  nativefier \
    https://calendar.google.com \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --maximize \
    --user-agent firefox \
    --single-instance \
    --verbose \
    --inject "${pkgname}.css"
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

