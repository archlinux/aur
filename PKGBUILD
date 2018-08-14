# Maintainer: Christian Bundy <christianbundy@fraction.io> 
pkgname=patchbay
pkgver=7.14.0
pkgrel=1
pkgdesc="An alternative Secure Scuttlebutt client interface that is fully compatible with Patchwork "
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchbay"
license=('MIT')
provides=('patchbay')
conflicts=('patchbay')
depends=('libsodium' 'gtk2' 'gconf' 'python' 'electron')
makedepends=('nodejs' 'npm' 'git')
options=(!strip)

source=(
"https://github.com/ssbc/${pkgname}/archive/v${pkgver}.zip"
'run.sh'
"${pkgname}.desktop"
)

md5sums=('a8f3c2724090e3c72ef1339a75785fb7'
         'eb46b144f64a8b91696292ee5bfca0b3'
         'f459479fef0987c5fa81a38b04767ffa')

build() {
    cd "${srcdir}/${pkgname}"

    # https://github.com/ssbc/patchbay/issues/224
    npm install --save "git+https://github.com/christianbundy/scuttle-invite.git#c4eb0b4a956927109eb176769570647fcc2d42b3"
    npm ci --only=production
    npm run rebuild
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
}
