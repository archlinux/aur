# Maintainer: akaessens

pkgname=google-calendar-nativefier-dark
pkgver=2021.04.24
pkgrel=1
pkgdesc='Google Calendar in shared Electron runtime with dark theme (by pyxelr)'
arch=('x86_64')
url='https://calendar.google.com'
license=('MIT')
depends=('electron')
makedepends=(
  'gendesk'
  'nodejs-nativefier'
)
source=("${pkgname}.png" "${pkgname}.js")
sha256sums=('97e7237e745704869306cc96856e320d673140ff6f91f9ed61b592e7afc0f176'
            'bd1a3d162153596ac3bda552de689d0bde95f038fcaf4f0d1143b2bdf16d03b2')

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
    --categories "Network;Office;Calendar;" \
    -n \
    -f
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
    --inject "${pkgname}.js" \
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
