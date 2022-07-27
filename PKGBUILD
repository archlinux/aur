# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: akaessens

pkgname=google-keep-nativefier
pkgver=2022.07.27
pkgrel=1
pkgdesc='Google Keep in shared Electron runtime'
arch=('x86_64')
url='https://keep.google.com'
license=('MIT')
depends=('electron18')
makedepends=(
  'gendesk'
  'nodejs-nativefier'
)

source=("${pkgname}.png")
sha256sums=('30bf408abb4d6639864c05a6c829fba7624bbec254eeab52a72ce0d8b91fbb1f')

_name='Google Keep'

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron18 /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Network;Office;Notes;" \
    -n \
    -f
}

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --browserwindow-options '{ "webPreferences": { "defaultFontFamily": { "standard": "Open Sans", "serif": "Open Sans", "sansSerif": "Open Sans" } } }' \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0" \
    --single-instance \
    --zoom "0.8" \
    https://keep.google.com/
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
