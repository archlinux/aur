# Maintainer: Zeta <z@gonzaleza.cr>
pkgname=('agente-gaudi' 'idopte-scm-middleware' 'firma-digital-librerias' 'bccr-certificados')
pkgver=Rev28
pkgrel=1
epoch=1
pkgdesc="\"Instalador\" de firma digital BCCR"
arch=(x86_64)
url="https://soportefirmadigital.com/sfdj/dl.aspx"
license=('MIT' 'unknown' 'unknown')
depends=()
makedepends=("unzip")
provides=()
# provides=("legacy.so" "libcrypto.so.3" "libidolog.so" "libidop11.so" "libssl.so.3" "libt_ias.so" "SCManager" "libASEP11.so" "libaseLaserP11.so")
options=("!strip")
# install=
# changelog=
source=("sfd_ClientesLinux_RPM64_Rev28.zip")
noextract=()
sha256sums=('f3c5fdd12686533ea60ddf3420e465b94228c7ed67474e031f86f60509f5e45d')

build() {
    unzip -o $source -d "$srcdir"
    bsdtar -xf "${srcdir}/Firma Digital/Idopte/scmiddleware-costa-rica-user_idopte_6.23.44.0_rh9_amd64.rpm" -C "${srcdir}/Firma Digital/Idopte"
    bsdtar -xf "${srcdir}/Firma Digital/Agente GAUDI/agente-gaudi_26.0_amd64.rpm" -C "${srcdir}/Firma Digital/Agente GAUDI"
}

package_bccr-certificados() {
    depends=("p11-kit")
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA POLITICA PERSONA FISICA - COSTA RICA v2.crt" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA POLITICA PERSONA FISICA - COSTA RICA v2.crt" 
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA POLITICA PERSONA JURIDICA - COSTA RICA v2.crt" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA POLITICA PERSONA JURIDICA - COSTA RICA v2.crt"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA POLITICA SELLADO DE TIEMPO - COSTA RICA v2.crt" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA POLITICA SELLADO DE TIEMPO - COSTA RICA v2.crt"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA RAIZ NACIONAL - COSTA RICA v2.crt" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA RAIZ NACIONAL - COSTA RICA v2.crt"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA SINPE - PERSONA FISICA v2(1).crt" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA SINPE - PERSONA FISICA v2(1).crt"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA SINPE - PERSONA FISICA v2.cer" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA SINPE - PERSONA FISICA v2.cer"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA SINPE - PERSONA JURIDICA v2(1).crt" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA SINPE - PERSONA JURIDICA v2(1).crt"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/CA SINPE - PERSONA JURIDICA v2.cer" "${pkgdir}/etc/ca-certificates/trust-source/anchors/CA SINPE - PERSONA JURIDICA v2.cer"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/Certificado Banco Central.cer" "${pkgdir}/etc/ca-certificates/trust-source/anchors/Certificado Banco Central.cer"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/GlobalSign CodeSigning CA - SHA256 - G3.cer" "${pkgdir}/etc/ca-certificates/trust-source/anchors/GlobalSign CodeSigning CA - SHA256 - G3.cer"
    install -Dm644 "${srcdir}/Firma Digital/Certificados/GlobalSign Root CA - R3.cer" "${pkgdir}/etc/ca-certificates/trust-source/anchors/GlobalSign Root CA - R3.cer"
}

package_agente-gaudi() {
    provides=("Agente-GAUDI")
    install -d "${srcdir}/Firma Digital/Agente GAUDI/opt" "${pkgdir}/opt" || echo "Failed"
    cp -r "${srcdir}/Firma Digital/Agente GAUDI/opt/"* "${pkgdir}/opt/" || echo "Failed"
    install -d "${srcdir}/Firma Digital/Agente GAUDI/usr" "${pkgdir}/usr" || echo "Failed"
    cp -r "${srcdir}/Firma Digital/Agente GAUDI/usr/"* "${pkgdir}/usr/" || echo "Failed"
}

package_idopte-scm-middleware() {
    depends=("pcsc-tools")
    provides=("legacy.so" "libcrypto.so.3" "libidolog.so" "libidop11.so" "libssl.so.3" "libt_ias.so" "SCManager" "idocachesrv")
    conflicts=("libcrypto.so.3")
    install -d "${srcdir}/Firma Digital/Idopte/etc" "${pkgdir}/etc"
    cp -r "${srcdir}/Firma Digital/Idopte/etc/"* "${pkgdir}/etc/" || echo "Failed"
    install -d "${srcdir}/Firma Digital/Idopte/usr" "${pkgdir}/usr" || echo "Failed"
    cp -r "${srcdir}/Firma Digital/Idopte/usr/"* "${pkgdir}/usr/" || echo "Failed"
}

package_firma-digital-librerias() {
    provides=("libASEP11.so" "libaseLaserP11.so")
    install -Dm644 "${srcdir}/Firma Digital/Librería/libASEP11.so" "${pkgdir}/usr/lib/libASEP11.so"
    install -Dm644 "${srcdir}/Firma Digital/Librería/libaseLaserP11.so" "${pkgdir}/usr/lib/libaseLaserP11.so"
}

post_install() {
    update-ca-trust
}

post_update() {
    post_install
}
