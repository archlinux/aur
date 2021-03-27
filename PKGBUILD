# Maintainer: lsf
# Contributer: Sam Whited <sam@samwhited.com>
# Contributor: Roman Kupriyanov <mr.eshua@gmail.com>

pkgname=jitsi-meet-desktop
pkgver=2.8.3
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
             'npm'
             'python2'
             'png++'
             'libxtst'
             'nvm'
             )

options=(!strip)
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/jitsi/jitsi-meet-electron/archive/v${pkgver}.tar.gz"
        'jitsi-meet-desktop.desktop')
sha256sums=('af70e9fa570e72f928fffbb1eb90b6908d01c8a23bd6d89b5c21d3d691b517fc'
            '36a30a15613d53b2a01626a5551315c6970889ce3c2688bce71e26c3333081a4')

prepare() {
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install 14 && nvm use 14

  cd jitsi-meet-electron-${pkgver}/

  sed -r 's#("electron": ").*"#\1'$(cat /usr/lib/electron/version)'"#' -i package.json

  export npm_config_cache="${srcdir}/npm_cache"
  npm install
  # npm audit fix
}

build() {
  cd jitsi-meet-electron-${pkgver}/
  npm run build
  npx electron-builder --dir
  npm config set prefix ${_npm_prefix}
  nvm unalias default
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

  install -Dm644 -- resources/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  cat << EOF > "$pkgdir"/usr/bin/$pkgname
#!/bin/sh

NODE_ENV=production ELECTRON_IS_DEV=false exec electron /opt/$pkgname/app.asar "\$@"
EOF

  chmod +x "$pkgdir"/usr/bin/$pkgname

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
