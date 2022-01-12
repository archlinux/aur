# Maintainer: DatCom <github+aur@datcom-unibw.de>

pkgname=datcom-jitsi-meet-electron
pkgver=2021.12.300
pkgrel=1
pkgdesc="DatCom Jitsi Meet Desktop"
arch=('x86_64')
url="https://github.com/datcom-unibw/jitsi-meet-electron"

license=('APACHE-2.0')

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

source=(datcom-jitsi-meet-electron.desktop
        "jitsi-meet-electron-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        )

sha256sums=('5976b5ced6c707d79cc21666abcbfc11c6d8f1b83eb8505dc8b29d62ca85c7e9'
            '44cfdf34d04231d5b37327a9daa2e1f9f49c880329d5742e5d77537a0a64df8f'
            )

            
prepare() {
  export npm_config_cache="$srcdir/npm_cache"
  _npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install 14 && nvm use 14

  cd jitsi-meet-electron-${pkgver}/
  sed -i 's#git+ssh://git@github.com#https://github.com#' package-lock.json
  sed -r 's#("electron": ").*"#\1'$(cat /usr/lib/electron/version)'"#' -i package.json

  export npm_config_cache="${srcdir}/npm_cache"
  npm install
}
            
build() {
    cd jitsi-meet-electron-${pkgver}/
    npm run build
    npx electron-builder --dir
    npm config set prefix ${_npm_prefix}
    nvm unalias default
}

package() {
	_dist_path=${srcdir}/jitsi-meet-electron-${pkgver}/dist/linux-unpacked

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/datcom-jitsi-meet-electron"
    cp -r "${_dist_path}"/resources/* "${pkgdir}/opt/datcom-jitsi-meet-electron"

    install -Dm644 -- ${srcdir}/jitsi-meet-electron-$pkgver/resources/icon.png "${pkgdir}/usr/share/pixmaps/datcom-jitsi-meet-electron.png"

    cat << EOF > "$pkgdir"/usr/bin/datcom-jitsi-meet-electron
#!/bin/sh

NODE_ENV=production ELECTRON_IS_DEV=false exec electron /opt/datcom-jitsi-meet-electron/app.asar "\$@"
EOF

    chmod +x "$pkgdir"/usr/bin/datcom-jitsi-meet-electron

    install -Dm644 "${srcdir}/datcom-jitsi-meet-electron.desktop" "${pkgdir}/usr/share/applications/datcom-jitsi-meet-electron.desktop"
}
