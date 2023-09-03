# Maintainer: Fijxu <fijxu <at> zzls <dot> xyz>

_pkgname=tetrio-desktop
_electron=electron
pkgname=tetrio-desktop-electron
pkgver=8.0.0
pkgrel=1
pkgdesc='TETR.IO desktop client, using the system Electron package'
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('custom')
url='https://tetr.io/'
depends=('libxss' 'electron')
makedepends=('asar')
source=("$_pkgname::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        "tetrio-launcher.sh"
        "LICENSE") # https://tetr.io/about/terms/
sha256sums=('ae07110f88692e1485f7ef1d3ab5eff95774746631b17833e28cc09ba1a38bda'
            '1ad8e0a43663a61e7f8c55bdacda8554b7bcce14ce20fb0cbfb69991cf07cd19'
            '7551ee514200d99a7ff1728ecbc48f290e2e2123b60bfdfb655e1fa61da92290')

prepare() {
    sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" tetrio-launcher.sh
    
    tar -xf data.tar.xz
    sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" usr/share/applications/tetrio-desktop.desktop
    asar e opt/TETR.IO/resources/app.asar opt/TETR.IO/resources/app
    rm opt/TETR.IO/resources/app.asar
    # Disable --no-sandbox. It causes TETR.IO to crash.
    sed -i "s|app.commandLine.appendSwitch('--no-sandbox');|// app.commandLine.appendSwitch('--no-sandbox');|" opt/TETR.IO/resources/app/main.js
    sed -i "/app\.commandLine\.appendSwitch('--ignore-gpu-blocklist');/a app.commandLine.appendSwitch('--enable-gpu-rasterization');" opt/TETR.IO/resources/app/main.js
    asar p opt/TETR.IO/resources/app opt/TETR.IO/resources/app.asar --unpack-dir '**'
    rm -rf opt/TETR.IO/resources/app
}

package() {
    install -d "$pkgdir"/usr/lib/$_pkgname

    cp -r $srcdir/opt/TETR.IO/resources/*  "$pkgdir"/usr/lib/$_pkgname/
    install -d "$pkgdir"/usr/{bin,share/{icons,applications}}
    install -Dm 755 "${srcdir}/tetrio-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"

    cp -r $srcdir/usr/share/icons/hicolor "$pkgdir"/usr/share/icons/
    cp $srcdir/usr/share/applications/tetrio-desktop.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chmod -R go-w "$pkgdir"
}

