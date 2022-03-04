# Maintainer: sukanka <su975853527 [AT] gmail.com>
pkgname=clash-for-windows-electron-bin
_pkgname=${pkgname%-bin}
pkgver=0.19.11
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron. Using system clash and electron"
arch=("x86_64")
parch=$(echo ${arch} | sed "s/x86_64/x64/")
license=('unknown')
url="https://github.com/Fndroid/clash_for_windows_pkg"
install=clash-for-windows-bin.install

provides=('clash-for-windows' ${_pkgname})
conflicts=('clash-for-windows' 'clash-for-windows-bin')

depends=('electron'
'clash'
'clash-geoip'
)

optdepends=(
    'nftables: TUN mode required.'
    'iproute2: TUN mode required.'
    'clash-premium-tun: TUN mode required'
)
makedepends=('asar'
'npm'
)

source=(
    "${pkgname}-${pkgver}-${arch}-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-${parch}-linux.tar.gz"
    "clash-for-windows.desktop"
    "cfw"
    "clash-core-service@.service"
    )
sha256sums=('50fb2ab3e59c77773073a89ce6eb7622b4e4fc2b7bb23b1671a7b1c11841cfbf'
            '340ee7a8c8e7da27eca9891dbc6997e7b2d87607947e8010903fb79d1fbb9da6'
            'db2e160e5d5cf82ed69d0926ac51c0eccb9efc541f89be3bb467d85be509f735'
            '2b442597786baf78b3994be08801c366f80acc500dc210705ee5cd7a4b793951')

build() {
    cd $srcdir
    sed -i "s/pkgver/${pkgver}/" clash-for-windows.desktop
    
    cd "Clash for Windows-${pkgver}-${parch}-linux"/resources/
    asar e app.asar apps
    
    # fix for autostart and system electron
    cd apps
    sed -i 's|r=n\[1\],|r="cfw\\nIcon=clash\\n",|g' dist/electron/renderer.js
    sed -i 's|"electron-log": "^4.1.0",|"electron-log": "^4.4.6",|g' package.json
    
    npm install
    cd ..
    asar p apps app.asar
}

package() {
    cd $srcdir
    
    install -Dm755 cfw -t ${pkgdir}/usr/bin
    install -Dm644 "clash-for-windows.desktop" -t ${pkgdir}/usr/share/applications
    install -Dm644 "clash-core-service@.service" -t ${pkgdir}/usr/lib/systemd/system/
    
    cd "Clash for Windows-${pkgver}-${parch}-linux"
    install -Dm644 resources/app.asar -t ${pkgdir}/opt/clash-for-windows/
    
    cp -pvr resources/static ${pkgdir}/opt/clash-for-windows/
    
    cd resources/apps/dist/electron/static/imgs
    install -Dm644 logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/clash.png
    
    cd ${pkgdir}/opt/clash-for-windows/static/files
    rm -rf linux/{common,x64/clash-linux} default/Country.mmdb
    ln -s /usr/bin/clash linux/x64/clash-linux
    ln -s /etc/clash/Country.mmdb default/Country.mmdb
}
