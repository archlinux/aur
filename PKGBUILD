# Maintainer: Christian Bundy <christianbundy@fraction.io> 
pkgname=patchbay
pkgver=7.15.6
pkgrel=2
pkgdesc="An alternative Secure Scuttlebutt client interface that is fully compatible with Patchwork"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchbay"
license=('MIT')
depends=('libsodium' 'gtk2' 'gconf' 'python' 'electron2')
makedepends=('nodejs' 'npm' 'git')
options=(!strip)

source=(
"https://github.com/ssbc/${pkgname}/archive/v${pkgver}.zip"
'run.sh'
"${pkgname}.desktop"
)

md5sums=('51d38e7e27643a8616e0d9331c13d9fa'
         'e7f5fd2469bf175658b9b5b57c4b7057'
         'f459479fef0987c5fa81a38b04767ffa')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    npm ci --only=production --ignore-scripts
    npm rebuild \
      --runtime=electron \
      --target=$(electron2 -v) \
      --abi=$(electron2 --abi) \
      --disturl=https://atom.io/download/atom-shell
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
}
