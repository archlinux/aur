pkgname=streambooru-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="StreamBooru - multi-site booru browser (Electron)"
arch=('x86_64')
url="https://github.com/Amateur-God/StreamBooru"
license=('GPLv3')
depends=('electron' 'nss' 'gtk3' 'libxss' 'libxtst' 'alsa-lib')
makedepends=('npm' 'nodejs' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Amateur-God/StreamBooru/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b5bddb263963f307a5eda57fc2ad2c9e33a71fc12b9f9933baff7af5110d9a3d')

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
