# Maintainer: Ezozbek Rasulov <arch@ezozbek.dev>
pkgname=e-imzo
pkgver=5.00
pkgrel=1
pkgdesc="Uzbek state web identity proving & key signing (E-IMZO)"
arch=('x86_64')
url="https://e-imzo.soliq.uz"
license=('Proprietary')
depends=('jre8-openjdk' 'pcsclite' 'ccid')
makedepends=()
source=("https://cdn.xinux.uz/e-imzo/E-IMZO-v${pkgver}.tar.gz" 'e-imzo.service')
sha256sums=('8cf019bbdf29ae40b835095f03cfe426ec3da9d0ab4924b2cf249258f9485e96'
            '8e3596d57ef7a185d850bd15d28876bb3395c5964e9002a1ed86f76f9696aff0')

package() {
   mkdir -p "${pkgdir}/usr/lib/${pkgname}"
   mkdir -p "${pkgdir}/usr/bin"
   mkdir -p "${pkgdir}/usr/lib/systemd/user"

   install -m 644 E-IMZO/E-IMZO.jar "${pkgdir}/usr/lib/${pkgname}/"
   install -m 644 E-IMZO/E-IMZO.pem "${pkgdir}/usr/lib/${pkgname}/"
   install -m 644 E-IMZO/truststore.jks "${pkgdir}/usr/lib/${pkgname}/"

   cp -r E-IMZO/lib "${pkgdir}/usr/lib/${pkgname}/"

   install -m 644 e-imzo.service "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

   cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
cd "/usr/lib/${pkgname}"

# Execute using JRE 8, explicitly linking the system PCSC smartcard library
/usr/lib/jvm/java-8-openjdk/jre/bin/java \
  -Dsun.security.smartcardio.library=/usr/lib/libpcsclite.so \
  -jar E-IMZO.jar "\$@"

exit 0
EOF

   chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
