# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=pylance-language-server
pkgver=$(./version.sh)
pkgrel=1
pkgdesc='Python language server based on pylance vscode extension.'
arch=('x86_64')
url='https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance'
license=('custom: commercial')
depends=('nodejs')
provides=('pylance-language-server')
conflicts=('pylance-language-server')
install=pylance-language-server.install
_publisher='ms-python'
_extension='vscode-pylance'
source=("pylance-${pkgver}.zip::https://${_publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${_publisher}/extension/${_extension}/${pkgver}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/extension"
    install -d "${pkgdir}/usr/bin"
    find dist package.json package.nls.json package.nls.ru.json -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/opt/${pkgname}/{}" \;
    sed -ri -e '1i #!/usr/bin/env node\n' "${pkgdir}/opt/${pkgname}/dist/server.bundle.js"
    chmod +x "${pkgdir}/opt/${pkgname}/dist/server.bundle.js"
    ln -s "/opt/${pkgname}/dist/server.bundle.js" "${pkgdir}/usr/bin/pylance-language-server"
    install -Dm 644 "${srcdir}/extension/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
