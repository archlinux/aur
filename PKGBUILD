# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=parabolic
pkgver=2023.12.0
pkgrel=1
pkgdesc="Download web video and audio"
arch=('x86_64')
url="https://github.com/NickvisionApps/Parabolic"
license=('MIT')
depends=('bash' 'dotnet-runtime' 'ffmpeg' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'python-psutil' 'yt-dlp')
makedepends=('blueprint-compiler' 'dotnet-sdk' 'libadwaita')
provides=('tube-converter')
conflicts=('tube-converter')
replaces=('tube-converter')
_commit='cbc0135ee8a02f85d6f1a8525096c26d059886e8'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/NickvisionApps/CakeScripts/archive/${_commit}.tar.gz")
sha256sums=('77c33fe556eab5721d4deaa6a8425b6d5305852b46b1ca85355c07a859ccbdde'
            '93961fc1fde9b4f01f86197946accfefb227ef34a3cc1719a203235ea56a837e')

prepare() {
    mv "CakeScripts-${_commit}"/* "${pkgname^}-${pkgver}/CakeScripts"
    cd "${pkgname^}-${pkgver}"
    dotnet tool restore
}

build() {
    cd "${pkgname^}-${pkgver}"
    dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

package() {
    cd "${pkgname^}-${pkgver}"
    dotnet cake --target=Install --destdir="${pkgdir}"
    ln -s org.nickvision.tubeconverter "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
