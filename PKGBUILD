# Maintainer: Michael Hughes <mhughes+aur at mhughes dot dev>
# Contributor: Saurabh Kumar Sharma <saurabh000345 at gmail dot com>

pkgname="soundcloud-nativefier"
pkgver=20230310
pkgrel=1
pkgdesc="SoundCloud desktop app built with nativefier (electron)"
arch=("x86_64")
url="https://soundcloud.com"
license=("MIT")
_electron=22
depends=("electron${_electron}")
makedepends=(
  "curl"
  "gendesk"
  "yarn"
)
_name="SoundCloud"

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electron} /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    --categories "Audio;AudioVideo;Player;" \
    -n \
    -f
  curl \
    "https://d21buns5ku92am.cloudfront.net/26628/images/419677-sc-logo-vertical-black%20%281%29-81a8fc-original-1645807040.png" \
    > "${pkgname}.png"
}

build() {
  cd "${srcdir}"
  yarn add nativefier
  yarn nativefier \
    https://soundcloud.com \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --maximize \
    --user-agent safari \
    --single-instance \
    --verbose
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