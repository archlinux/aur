# Maintainer: sukanka <su975853527 [AT] gmail.com>
pkgname=clash-for-windows-electron-bin
_pkgname=${pkgname%-bin}
pkgver=0.19.28
pkgrel=1
pkgdesc="A Windows/macOS/Linux GUI based on Clash and Electron. Using system clash and electron"
arch=("x86_64" "aarch64")
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
makedepends=('asar' 'npm')
source_x86_64=("${pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-x64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/${pkgver}/Clash.for.Windows-${pkgver}-arm64-linux.tar.gz")
source=(
    "clash-for-windows.desktop"
    "cfw"
    "cfw-start-pre.sh"
    "clash-core-service@.service")
sha256sums=('9a84b05b718913d3d1fbe462a2da671abff2cb94bb2ded75a3af12204cebe32f'
            'db2e160e5d5cf82ed69d0926ac51c0eccb9efc541f89be3bb467d85be509f735'
            '2d1cb05f33eef51d01bca397ac52796a557b812b243f0d5e5377f7640e4d4433'
            '54d4d262356044fb75ce7bdee662aa44046842f9c70765cd6dd0185415388409')
sha256sums_x86_64=('28377eb5ef5c07a64316bed3c912a8633d8b9ba485e89b4a50fd39b24fe956b5')
sha256sums_aarch64=('69c835c79343295aa848e99918d98176141212d45de14c7d0d5272fecde9f8fc')

_parch=$(echo ${arch} | sed "s/x86_64/x64/;s/aarch64/arm64/")
build() {
    cd $srcdir
    sed -i "s/pkgver/${pkgver}/" clash-for-windows.desktop

    cd "Clash for Windows-${pkgver}-${_parch}-linux"/resources/
    asar e app.asar apps

    # fix for autostart and system electron
    cd apps
    sed -i 's|r=n\[1\],|r="cfw\\nIcon=clash\\n",|g' dist/electron/renderer.js
    sed -i 's|"electron-log": "^4.1.0",|"electron-log": "^4.4.6",|g' package.json

    export HOME=$srcdir
    npm install
    cd ..
    asar p apps app.asar
}

package() {
    cd $srcdir

    install -Dm755 cfw -t ${pkgdir}/usr/bin
    install -Dm644 "clash-for-windows.desktop" -t ${pkgdir}/usr/share/applications
    install -Dm644 "clash-core-service@.service" -t ${pkgdir}/usr/lib/systemd/system/
    install -Dm755 cfw-start-pre.sh -t ${pkgdir}/opt/clash-for-windows

    cd "Clash for Windows-${pkgver}-${_parch}-linux"
    install -Dm644 resources/app.asar -t ${pkgdir}/opt/clash-for-windows/

    cp -pvr resources/static ${pkgdir}/opt/clash-for-windows/

    cd resources/apps/dist/electron/static/imgs
    install -Dm644 logo.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/clash.png

    cd ${pkgdir}/opt/clash-for-windows/static/files
    rm -rf linux/{common,${_parch}/clash-linux} default/Country.mmdb
    ln -s /usr/bin/clash linux/${_parch}/clash-linux
    ln -s /etc/clash/Country.mmdb default/Country.mmdb
}
