# Maintainer: lsf
# Contributer: Sam Whited <sam@samwhited.com>
# Contributor: Roman Kupriyanov <mr.eshua@gmail.com>

pkgname=jitsi-meet-desktop
pkgver=2.5.1
pkgrel=1
pkgdesc="Jitsi Meet desktop application"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
conflicts=('jitsi-meet-electron-bin'
           'jitsi-meet-electron')
replaces=('jitsi-meet-electron')
depends=('electron'
         'gtk3'
         'libxss'
         'nss')
makedepends=('coreutils'
             'git'
             'npm')

options=(!strip)
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/jitsi/jitsi-meet-electron/archive/v${pkgver}.tar.gz"
        'jitsi-meet-desktop.desktop')
sha256sums=('a79493bc982173e40124995e921b7d7f074205e5fc9a395fc6b4d15a39c7eb98'
            '36a30a15613d53b2a01626a5551315c6970889ce3c2688bce71e26c3333081a4')

prepare() {
  cd jitsi-meet-electron-${pkgver}/

  sed -r 's#("electron": ").*"#\1'$(cat /usr/lib/electron/version)'"#' -i package.json

  export npm_config_cache="${srcdir}/npm_cache"
  npm install
  npm audit fix
}

build() {
  cd jitsi-meet-electron-${pkgver}/
  npm run build
  npx electron-builder --dir
}

package() {
  cd jitsi-meet-electron-${pkgver}/

  if [[ ${CARCH} == "aarch64" ]]; then
    _dist_path=${srcdir}/jitsi-meet-electron-${pkgver}/dist/linux-arm64-unpacked
  elif [[ ${CARCH} == "armv7h" ]]; then
    _dist_path=${srcdir}/jitsi-meet-electron-${pkgver}/dist/linux-armv7l-unpacked
  elif [[ ${CARCH} == "x86_64" ]]; then
    _dist_path=${srcdir}/jitsi-meet-electron-${pkgver}/dist/linux-unpacked
  fi

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${_dist_path}"/resources/* "${pkgdir}/opt/${pkgname}"

  for icon in `ls resources/icons/*.png`; do
    size=$(basename $icon)
    size=${size#"icon_"}
    size=${size%".png"}
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/jitsi-meet-desktop.png"
  done

 cat << EOF > "$pkgdir"/usr/bin/$pkgname
#!/bin/sh

NODE_ENV=production ELECTRON_IS_DEV=false exec electron /opt/$pkgname/app.asar "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/$pkgname

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
