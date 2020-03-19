# Maintainer: Olegs Jeremejevs <olegs@jeremejevs.com>

pkgname=notion-nativefier
pkgver=2020.03.18
pkgrel=1
pkgdesc='The all-in-one workspace for your notes, tasks, wikis, and databases'
arch=('any')
url='https://notion.so'
license=('custom')
depends=('electron')
makedepends=(
  'curl'
  'gendesk'
  'nodejs-nativefier'
)

_name=Notion

prepare() {
  cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron /usr/share/${pkgname} "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_name}" \
    -n \
    -f
  curl https://www.notion.so/images/logo-ios.png > "${pkgname}.png"
}

build() {
  cd "${srcdir}"
  nativefier \
    --name "${_name}" \
    --icon "${pkgname}.png" \
    --maximize \
    --single-instance \
    --verbose \
    notion.so
}

package() {
  mkdir -p "${pkgdir}/usr/share"
  cp -r "${_name}-linux-"*"/resources/app" "${pkgdir}/usr/share/${pkgname}"
  install -D -m 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
  install -D -m 644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -D -m 644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}
