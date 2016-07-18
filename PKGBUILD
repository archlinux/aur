# Maintainer: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20160718
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/icp-brasil/certificados/188-atualizacao/4530-ac-raiz"
license=('GPL')
depends=('ca-certificates-utils')
makedepends=('unzip' 'openssl')
source=(
    "icpbr_certs-${pkgver}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip"
    )

sha512sums=('2d2f80b5451b99f53fd896e4223cecb3e6fe01bd669f23f3a77cea3717ea9415cf16b8aa4035938d42751639eb7bf5116984b4b7c9b62d2353f38050d976c1c0')

package() {
  local cert_tag='icp_br'
  cd ${srcdir}
  find * -print0 | while read -d $'\0' cert; do
    #some certificates have a .crt extension but come in DER format.
    #convert them
    if [[ "$(file $cert | cut -f2 -d\: | tr -d ' ')" = "data" ]]; then
      msg2 "converting $cert from DER to PEM..."
      cert_der="${cert}.der"
      mv $cert $cert_der
      /usr/bin/openssl x509 -in ${cert_der} -inform der -out $cert
      rm "$cert_der"
    fi
    #some of the cert files have spaces in their names, so just remove the spaces
    #when 'tagging' the certificates
    mv "$cert" "${cert_tag}.${cert//' '/'_'}"
  done
  install -d -m0755 $pkgdir/etc/ca-certificates/trust-source/anchors
  install -m0644 *.crt $pkgdir/etc/ca-certificates/trust-source/anchors
}
