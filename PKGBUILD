# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20200325
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="https://www.iti.gov.br/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('834d4cd60089f09f9c7476237ed8d2da79f76308bc25c1e295dc4c5b96111d26d66670f44b77dbd27adcc9ce794aeb8b39f1b0a53aa5775172220ffeb953cf61')
noextract=("icpbr_certs-${pkgver}-${pkgrel}.zip")

_source="icpbr_certs-${pkgver}-${pkgrel}"

prepare() {
    rm -rf "$_source" && mkdir "$_source"
    unzip "$_source.zip" -d "$_source"
}

package() {
  cd "$_source"

  find * -print0 | while read -d $'\0' cert; do
      # Edit filenames removing whitespaces and prepending 'icp_br'
    mv "$cert" "icp_br.${cert//' '/'_'}"
  done
  install -d -m0755 "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
  install -m0644 *.crt "$pkgdir/usr/share/ca-certificates/trust-source/anchors"
}
