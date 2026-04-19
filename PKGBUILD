# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=idescriptor-appimage
pkgver=0.5.0
pkgrel=1
pkgdesc="Cross-platform iDevice management tool (AppImage)"
arch=('x86_64')
url="https://github.com/iDescriptor/iDescriptor"
license=('GPL3')
provides=("idescriptor")
conflicts=("idescriptor" "idescriptor-bin" "idescriptor-git")
depends=('fuse2' 'zlib')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.zip::https://github.com/iDescriptor/iDescriptor/releases/download/v${pkgver}/iDescriptor-v${pkgver}-Linux_x86_64.AppImage.zip"
        "LICENSE::https://raw.githubusercontent.com/iDescriptor/iDescriptor/main/LICENSE")
sha256sums=('cd30952fbc2a7b63ce87f431a04ecf94db45fe64203bf20e90d195a97c073184'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')

latestver() {
    gh api --paginate repos/iDescriptor/iDescriptor/releases --jq '.[] | select(.prerelease == false and .draft == false) | .assets[]?.name' |
    sed -nE '/^iDescriptor-v[0-9.]+-Linux_x86_64\.AppImage\.zip$/{s/^iDescriptor-v//; s/-Linux_x86_64\.AppImage\.zip$//; p; q}'
}

package() {
    # Install AppImage to /opt
    install -dm755 "${pkgdir}/opt/${pkgname%-bin}"
    install -m755 "${srcdir}/iDescriptor-v${pkgver}-Linux_x86_64.AppImage" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
    
    # Symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage" "${pkgdir}/usr/bin/${pkgname%-bin}"
    
    # Install License
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
