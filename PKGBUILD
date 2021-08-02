# Maintainer: Alec Mev <alec@mev.earth>

pkgname=todoist-nativefier
pkgver=2021.06.30
pkgrel=2
pkgdesc='Todoist in shared Electron runtime'
arch=('x86_64')
url='https://todoist.com'
license=('MIT')
# Would be nice to use the latest Electron, but, for example, I've encountered
# an issue where new windows get stuck on about:blank in Electron 13, but not in
# Electron 12, the latest supported by Nativefier.
_electronv=
depends=("electron${_electronv}")
makedepends=(
  'curl'
  'gendesk'
  'nodejs-nativefier'
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
    --categories "Network;Office;ProjectManagement;" \
    -n \
    -f
  curl \
    https://d3ptyyxy2at9ui.cloudfront.net/todoist_apple_touch_icon-4b89ad.png \
    > "${pkgname}.png"
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
