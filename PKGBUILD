# Maintainer: Christian Bundy <christianbundy@fraction.io> 
pkgname=patchbay-git
pkgver=7.14.0.r38.af7e412
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
_srcname=patchbay

source=(
"git+https://github.com/ssbc/${_srcname}.git"
'run.sh'
"${_srcname}.desktop"
)

md5sums=('SKIP'
         '1f9644b6941ee0dbd55e4cda6a69604e'
         'f459479fef0987c5fa81a38b04767ffa')

pkgver() {
  cd "${_srcname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

build() {
    cd "${srcdir}/${_srcname}"
    npm ci --only=production
}

package() {
    cd "${srcdir}/${_srcname}"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_srcname}.png"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${_srcname}"
    install -D "${_srcname}.desktop" "${pkgdir}/usr/share/applications/${_srcname}.desktop" 
}
