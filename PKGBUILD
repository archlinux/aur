# Maintainer: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20160607
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/icp-brasil/certificados/188-atualizacao/4530-ac-raiz"
license=('GPL')
depends=('ca-certificates-utils')
makedepends=('unzip' 'openssl')
install='ca-certificates-icp_br.install'
source=(
    "icpbr_certs-${pkgver}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip"
    )

sha512sums=('42cfe68a97da13dca5bc4839916af7e8a82c841f6445e315b214c5fde255c80cce0816714dc2704ab1816046bdccc5df675bf0fdba39fc8ed5585da44d5fd76c')

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
