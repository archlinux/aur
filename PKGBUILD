# Maintainer: robertfoster

pkgname=cie-middleware-git
pkgver=r68.78d2e63
pkgrel=1
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux (mio fork)"
arch=('any')
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('gcc-libs' 'glibc' 'openssl' 'pcsclite')
makedepends=('gradle')
install="${pkgname%-git}.install"
_shortname=cieid

source=("${pkgname%-git}::git+https://github.com/M0Rf30/${pkgname%-git}-linux")

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "${srcdir}/${pkgname%-git}"
    gradle -b cie-java/build.gradle standalone
    cd libcie-pkcs11/Release
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 cie-java/bin/libs/CIEID-standalone.jar \
    "${pkgdir}/usr/share/cieid/cieid.jar"

    install -Dm755 libcie-pkcs11/Release/libcie-pkcs11.so \
    "${pkgdir}/usr/lib/libcie-pkcs11.so"
    install -Dm644 "data/cieid.desktop" \
    "${pkgdir}/usr/share/applications/cieid.desktop"
    install -Dm755 data/logo.png \
    "${pkgdir}/usr/share/pixmaps/cieid.png"
    install -Dm755 "data/cieid.sh" \
    "${pkgdir}/usr/bin/cieid"
    install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/cieid/LICENSE"
}
md5sums=('SKIP')
