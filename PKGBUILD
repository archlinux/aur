# Maintainer: Fijxu <fijxu <at> zzls <dot> xyz>

# Thanks to the tetrio-desktop and discord_arch_electron packages!!!

_pkgname=tetrio-desktop
_electron=electron
pkgname=tetrio-desktop-electron
pkgver=10.0.0
pkgrel=1
pkgdesc='TETR.IO desktop client, using the system Electron package'
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('custom')
url='https://tetr.io/'
depends=('libxss' 'electron')
makedepends=('asar')
# We use the .deb one because it provides .desktop and icon files, it is more easy to deal with it. ;)
source=(
    "$_pkgname::https://tetr.io/about/desktop/builds/10/TETR.IO%20Setup.deb"
    "tetrio-launcher.sh"
    "tetrio-desktop.desktop"
    "tetrio-desktop-vsync.desktop"
    "LICENSE"
    ) # https://tetr.io/about/terms/
sha256sums=(
    'e3635a6f8d479bbf8dc56fdee7a65b2cf652e9633ef6e1acfc6c6f7055b4abdf'
    'e36fa282854c1fe3f6ee12a4e53c0a5b410a9cd5289e6f6250b7fcdd3c63cc2b'
    '86bef551ba0a8f868659488edb1e7768bf844264d29fe84615525b759c8f1238'
    '9e4bb8545a2b0d2f6d552933c3de905a9b12b398582b6987e4589e2a088b640b'
    '7551ee514200d99a7ff1728ecbc48f290e2e2123b60bfdfb655e1fa61da92290'
    )

prepare() {
    sed -i "s|@PKGNAME@|${_pkgname}|;s|@ELECTRON@|${_electron}|" tetrio-launcher.sh

    tar -xf data.tar.xz
    sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname --disable-frame-rate-limit --disable-gpu-vsync|" $srcdir/tetrio-desktop.desktop
    sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" $srcdir/tetrio-desktop-vsync.desktop
    asar e opt/TETR.IO/resources/app.asar opt/TETR.IO/resources/app
    rm opt/TETR.IO/resources/app.asar
    # Disable --no-sandbox. It causes TETR.IO to crash.
    sed -i "s|app.commandLine.appendSwitch('--no-sandbox');|// app.commandLine.appendSwitch('--no-sandbox');|" opt/TETR.IO/resources/app/main.js
    sed -i "s|app.commandLine.appendSwitch('--disable-frame-rate-limit');|// app.commandLine.appendSwitch('--disable-frame-rate-limit');|" opt/TETR.IO/resources/app/main.js
    sed -i "s|app.commandLine.appendSwitch('--disable-gpu-vsync');|// app.commandLine.appendSwitch('--disable-gpu-vsync');|" opt/TETR.IO/resources/app/main.js
    # Pack Tetrio .asar
    asar p opt/TETR.IO/resources/app opt/TETR.IO/resources/app.asar --unpack-dir '**'
    rm -rf opt/TETR.IO/resources/app
}

package() {
    install -d "$pkgdir"/usr/lib/$_pkgname

    cp -r $srcdir/opt/TETR.IO/resources/*  "$pkgdir"/usr/lib/$_pkgname/
    install -d "$pkgdir"/usr/{bin,share/{icons,applications}}
    install -Dm 755 "${srcdir}/tetrio-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"

    cp -r $srcdir/usr/share/icons/hicolor "$pkgdir"/usr/share/icons/
    install -D -m644 "${srcdir}/tetrio-desktop.desktop" "${pkgdir}/usr/share/applications/tetrio-desktop.desktop"
    install -D -m644 "${srcdir}/tetrio-desktop-vsync.desktop" "${pkgdir}/usr/share/applications/tetrio-desktop-vsync.desktop"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chmod -R go-w "$pkgdir"
}
