# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20210126
pkgrel=1
pkgdesc="Brazilian government Certification Authorities"
arch=('any')
url="https://www.gov.br/iti/pt-br/assuntos/repositorio/repositorio-ac-raiz"
license=('unknown')
depends=('ca-certificates-utils')
makedepends=('unzip')
source=("icpbr_certs-${pkgver}-${pkgrel}.zip::http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip")
sha512sums=('a3bb3013607972bf1708b2e44604f4f2413a122194bdb919e59cd3deaf972f677c69a1f5f712857614e9c26447888971447103a69ba48d65bcb7187fc0f870d5')
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
