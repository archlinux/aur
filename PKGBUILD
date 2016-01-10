# Maintainer: Tiago Brait <tiagobrait AT gmail DOT com>

#2014 tiagobrait
pkgname=ca-certificates-icp_br
pkgver=20160110
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="http://www.iti.gov.br/icp-brasil/certificados/188-atualizacao/4530-ac-raiz"
license=('GPL')
depends=('ca-certificates')
makedepends=('unzip openssl')
install='ca-certificates-icp_br.install'
source=(
    'http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip'
    )

sha512sums=(
    'e23ee7d5d79f66037afb13f00aae42ffbe86c290fb58331bab97b04ef29f80ff20075876ed85a57b8e3279ebcdcb5d8cb85aa9d380dec343b06cdfea79662998'
    )

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
  mv "$cert" "${cert_tag}.${cert//' '/'_'}"; done
  install -d -m0755 $pkgdir/etc/ca-certificates/trust-source/anchors
  install -m0644 *.crt $pkgdir/etc/ca-certificates/trust-source/anchors
}
