# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=notion-app-enhanced
pkgver=0.1.0
pkgrel=1
pkgdesc="The all-in-one workspace for your notes and tasks"
arch=('x86_64')
url="https://www.notion.so/desktop"
license=('Proprietary')
depends=('electron>=6.0')
makedepends=('yarn' 'imagemagick')
source=('notion-app-enhanced::git+https://gitlab.kokakiwi.net/kokakiwi/notion-app-enhanced.git')
sha256sums=('SKIP')

build() {
  cd "notion-app-enhanced"

  msg2 "Install dependencies"
  yarn

  msg2 "Package"
  yarn package:linux
}

package() {
  cd "notion-app-enhanced"

  install -dm0755 "${pkgdir}"/{opt,usr/{bin,share/applications}}

  msg2 "Copy package"
  cp -r "dist/Notion-linux-"* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/Notion" "${pkgdir}/usr/bin/${pkgname}"

  msg2 "Generate desktop file"
  gendesk -n -q -f \
    --pkgname="${pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --name="Notion" \
    --exec="/usr/bin/${pkgname}" \
    --startupnotify=true \
    --categories="Office;Application"
  echo "Encoding=UTF-8" >> "${pkgname}.desktop"
  echo "StartupWMClass=${pkgname}" >> "${pkgname}.desktop"
  install -Dm0644 "${pkgname}.desktop" "${pkgdir}"/usr/share/applications

  msg2 "Generate icons"
  for icon_size in 16 24 32 48 64 96 128 192 256 512; do
    icon_sizes="${icon_size}x${icon_size}"

    install -dm0755 "${pkgdir}/usr/share/icons/hicolor/${icon_sizes}/apps"
    convert img/notion-logo.png \
      -resize "${icon_sizes}" \
      "${pkgdir}/usr/share/icons/hicolor/${icon_sizes}/apps/${pkgname}.png"
  done
}

