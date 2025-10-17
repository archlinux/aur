pkgname=streambooru-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="StreamBooru - multi-site booru browser (Electron)"
arch=('x86_64')
url="https://github.com/Amateur-God/StreamBooru"
license=('MIT')
depends=('electron' 'nss' 'gtk3' 'libxss' 'libxtst' 'asoundlib')
makedepends=('npm' 'nodejs' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Amateur-God/StreamBooru/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb5b379dad18186a394180351bd5af506162a05b2974484af09f88630cd5debc')

build() {
  cd "${srcdir}/StreamBooru-${pkgver}"
  npm ci
  npx electron-builder --linux dir --config electron-builder.yml
}

package() {
  cd "${srcdir}/StreamBooru-${pkgver}"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r dist/linux-unpacked/* "${pkgdir}/opt/${pkgname}/"
  # launcher
  install -d "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /usr/bin/electron /opt/%s --no-sandbox "$@"\n' "${pkgname}" > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
  # desktop entry (optional)
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=StreamBooru
Comment=Multi-site booru browser
Exec=${pkgname} %U
Icon=streambooru
Terminal=false
Categories=Network;Utility;
EOF
}
