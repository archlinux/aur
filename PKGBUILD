# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20231124
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="https://www.gov.br/iti/pt-br/assuntos/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')

_source="icpbr_certs-${pkgver}-${pkgrel}"
source=("$_source.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
noextract=("$_source.zip")
sha512sums=('9c99b99980d623757e5a0c3b994e2c8a780fa0416121e594a9ad4e7be1a6d765b096433070c519e0c361a6a087e225798611ebd1669f4f9f6c019c4fd249bc27')
  # This checksum must match: http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/hashsha512.txt

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
