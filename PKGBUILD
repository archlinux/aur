# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20201125
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="https://www.gov.br/iti/pt-br/assuntos/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('eef2000eda27c303040d0f66e42a8c40a01f8a5d67d02e6097e08fb9bf2651808e041a0b67510e249d8d036c5b3632ebe3a1e8ccf37b4ebe10c01d330eaa3303')
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
