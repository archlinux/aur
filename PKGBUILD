# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=idescriptor-appimage
pkgver=0.1.2
pkgrel=1
pkgdesc="A tool to inspect Apple icons"
arch=('x86_64')
url="https://github.com/iDescriptor/iDescriptor"
license=('GPL3')
provides=("idescriptor")
conflicts=("idescriptor" "idescriptor-bin")
depends=('fuse2' 'zlib')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.zip::https://github.com/iDescriptor/iDescriptor/releases/download/v${pkgver}/iDescriptor-v${pkgver}-Linux_x86_64.AppImage.zip"
        "LICENSE::https://raw.githubusercontent.com/iDescriptor/iDescriptor/main/LICENSE")
sha256sums=('8559044aaa44e27fbc42ca0c76a236c838b7a4c01de1a1aa7731d0145cdb04cf'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')

pkgver() {
    curl -s "https://api.github.com/repos/iDescriptor/iDescriptor/releases/latest" |
    jq -r '.tag_name' | sed 's/^v//'
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
