# Maintainer: Alec Mev <alec@mev.earth>
# Contributor: akaessens

pkgname=google-calendar-nativefier
pkgver=2021.03.12
pkgrel=1
pkgdesc='Google Calendar in shared Electron runtime'
arch=('x86_64')
url='https://calendar.google.com'
license=('MIT')
depends=('electron')
makedepends=(
  'gendesk'
  'nodejs-nativefier'
)
install=google-calendar-nativefier.install
source=("${pkgname}.png")
sha256sums=('b6ade1c13d0f7cbab5bcba9071463293ea5a8251dd693dde80148dc6b6980b42')

_name='Google Calendar'

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;Calendar;" \
    -n \
    -f
}

build() {
  cd "${srcdir}"
  # https://regex101.com/r/GsAPiQ/1
  nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --internal-urls '^(https?:\/\/)?(calendar|accounts)\.google\.com(\/.*)?$' \
    --maximize \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0" \
    --single-instance \
    --verbose \
    https://calendar.google.com
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  local _x=`echo "${_name// /}-linux-"*`
  cp -r "${_x}/resources/app" "${pkgdir}/usr/share/${pkgname}"
  install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_x}/LICENSE"
  install -Dm 644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}
