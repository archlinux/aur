# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Tiago Brait <tiagobrait AT gmail DOT com>

pkgname=ca-certificates-icp_br
pkgver=20220905
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
sha512sums=('500f93716a05bfb193ddc6eecfbb46d43bf80a6ed9d9e5a3e317aae7afaf8535d768d695c95cf1b4f3f6f31e7b8fee549bfa82de72a57454a374e8d5b13a5161')
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
