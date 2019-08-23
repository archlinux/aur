# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20190823
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="https://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('540a9b6d77def3c04d00eeff44007df63abc20fc62cfb0c542adc0ce28ebdc2de4eb16a99f82c7b1404406a738044f987b80c4d4faab68bcad17a59f823af5d4')

prepare() {
    mv ACcompactado icpbr_certs-${pkgver}-${pkgrel}
}

package() {
  cd icpbr_certs-${pkgver}-${pkgrel}

  find * -print0 | while read -d $'\0' cert; do
      # Edit filenames removing whitespaces and prepending 'icp_br'
    mv "$cert" "icp_br.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -vm0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
