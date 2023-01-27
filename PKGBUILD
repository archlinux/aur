# Maintainer: Bruno Ancona <bruno at powerball253 dot com>

pkgname=eternalmodmanager
pkgver=3.0.0
pkgrel=1
pkgdesc='Cross-platform mod manager for DOOM Eternal.'
arch=('x86_64')
url='https://github.com/PowerBall253/EternalModManager-Avalonia'
license=('MIT')
depends=('dotnet-runtime>=7.0.0' 'dotnet-runtime<8.0.0' 'xorg-xprop')
makedepends=('git' 'dotnet-sdk>=7.0.0' 'dotnet-sdk<8.0.0')
source=("git+https://github.com/PowerBall253/EternalModManager-Avalonia.git#tag=v${pkgver}"
        eternalmodmanager)
sha256sums=('SKIP'
            '97bfa23542997c5f26e719d1c33cd15f5fb67475f1465e923e94fe51e9da7d29')

build() {
    cd "EternalModManager-Avalonia"

    # Build with dotnet
    dotnet publish -c Release -r linux-x64 --no-self-contained
}

package() {
    # Install app's files
    install -Dm755 -t "${pkgdir}/usr/bin" "$pkgname"

    cd "EternalModManager-Avalonia"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "resources/${pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/metainfo/" "resources/${pkgname}.appdata.xml"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "resources/${pkgname}.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    find "EternalModManager/bin/Release/net7.0/linux-x64/publish/" -type f -exec install -Dm775 -t "${pkgdir}/usr/lib/eternalmodmanager/" "{}" \;
}
