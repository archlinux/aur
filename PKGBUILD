# Maintainer: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20160916
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

sha512sums=('5af29a537927d53d1e9e842ba18da781f9c2cc514fab94c798c0c3a6317dc236ccb3aa5fbca1a4c0d174b6dc0a8d8fc1c0be3b0578e2fece616a4dc398f09e22')

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
