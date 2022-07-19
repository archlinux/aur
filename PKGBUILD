# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20220718
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
sha512sums=('c42422bfbe1a674d257330ab9d6abd57f2c77b983f168765cf3c3d6a5eb7a5280fba92dca3e3fc854d431996ba0e3cc91692f7ea623626564c7a1c48b7186913')
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
