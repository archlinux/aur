# Maintainer: let <let@notlet.dev>
# Please note that this is my first AUR package ever, let me know if I made any mistakes or you have any improvements.

pkgname=stabilitymatrix
pkgver=2.14.0
pkgrel=1
pkgdesc='Multi-Platform Package Manager for Stable Diffusion'
arch=('any')
url='https://github.com/LykosAI/StabilityMatrix'
license=('AGPL3')

depends=('dotnet-runtime' 'libxcrypt-compat')
makedepends=(
    'dotnet-sdk'
    'dotnet-sdk-8.0' # Needed for Husky to work
)

options=('!strip')

source=(
    'zone.lykos.stabilitymatrix.png'
    'zone.lykos.stabilitymatrix.desktop'
    "git+https://github.com/LykosAI/StabilityMatrix#tag=v${pkgver}"
)
sha256sums=(
    '0c32dcd560dfadae6c8cc1486fba1227e9cf93a55e3ba262571e83052e1bf22e'
    'd849617e6ade85b61f955d05d176f3ce07af0abb0532f554c4f73c19011ba0af'
    'SKIP'
)

build() {
    cd "$srcdir/StabilityMatrix"
    dotnet publish "./StabilityMatrix.Avalonia/StabilityMatrix.Avalonia.csproj" -o out -c Release -r linux-x64 -p:Version=$pkgver
}

package() {
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/StabilityMatrix/out" "${pkgdir}/opt/$pkgname"

    # Make a Data directory so that choosing portable mode doesn't error.
    mkdir -m777 "$pkgdir/opt/$pkgname/Data"

    # Desktop file and icon
    install -Dm644 "zone.lykos.stabilitymatrix.desktop" "${pkgdir}/usr/share/applications/zone.lykos.stabilitymatrix.desktop"
    install -D "zone.lykos.stabilitymatrix.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zone.lykos.stabilitymatrix.png"

}