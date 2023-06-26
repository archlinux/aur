# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=autenticacao-gov-pt-bin
pkgver=3.11.0
pkgrel=1
pkgdesc="Portuguese Citizen Card Application (Portugal eID) - version with pre compiled binaries by AMA"
arch=('x86_64')
url="http://www.cartaodecidadao.pt/"
license=('GPL2' 'LGPL3' 'custom:EUPL')
depends=('qt5-base'
         'qt5-tools'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'qt5-graphicaleffects'
         'pcsclite'
         'openssl'
         'openssl-1.1'
         'ccid'
         'libzip'
         'openjpeg2'
         'poppler-qt5'
         'poppler'
         'xerces-c'
         'libcurl-compat'
         'xml-security-c')
makedepends=('zstd' 'tar' 'flatpak' 'ostree')
optdepends=('plugin-autenticacao-gov-pt: Necessário para autenticações online'
'autenticacao-gov-pt-pki: PKI que confirma a validade dos certificados dos CC'
'ecce-gov-pt-certificates: Certificados da ECCE - quem assina dos certificados contidos em cartaodecidadao-pki')
conflicts=('cartaodecidadao' 'cartaodecidadao-bin' 'autenticacao-gov-pt')
replaces=('cartaodecidadao-bin')

source_x86_64=("https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak"
 "autenticacao-gov-pt-bin.install")

sha512sums_x86_64=('ec2b0fa55b0d3693349d8f46c13e42d5e1ad3a4145288e1fec2ecbd327c1a09786916cd1c08ea051391f1fe9826ab6e29c7e94e304f1cea867edc3307016528f'
                   'd38b9748f386fcf64f3f0cb717eccf7936c64f0e7b6370ae3b1b079902015ce56d3057afcf2877ca4eee38776269ac3642701803ba96b24a81cfccc9a4d3245f')

install='autenticacao-gov-pt-bin.install'

prepare() {
  mkdir -p pteid
  ostree init --repo=pteid --mode=bare-user
  ostree static-delta apply-offline --repo=pteid pteid-mw-linux.x86_64.flatpak
  ostree checkout --repo=pteid -U $(basename $(echo pteid/objects/*/*.commit | cut -d/ -f3- --output-delimiter= ) .commit) pteid_out
}

package() {
  mkdir -p "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/app/share"
  mv "${srcdir}"/pteid_out/files/{bin,include,lib,share} "${pkgdir}/usr/"
  # Create symlinks: until better alternative
  ln -sfn /usr/share/certs "${pkgdir}"/app/share/
  ln -sfn /usr/bin "${pkgdir}"/app/
  # cleanup pre packaged libraries
  rm -rf "${pkgdir}"/usr/include/zip*
  rm -rf "${pkgdir}"/usr/lib/libzip*
  rm -rf "${pkgdir}"/usr/lib/cmake/libzip*
  rm -rf "${pkgdir}"/usr/lib/libopenjp2*
  rm -rf "${pkgdir}"/usr/lib/libpcsclite*
  rm -rf "${pkgdir}"/usr/lib/libpoppler*
  rm -rf "${pkgdir}"/usr/lib/libxerces-c*
  rm -rf "${pkgdir}"/usr/lib/libxml-security-c*
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libopenjp2.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libpcsclite.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libzip.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/poppler-qt5.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/poppler.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/xerces-c.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/xml-security-c.pc
  rm -rf "${pkgdir}"/usr/share/man/man3/libcurl*
  rm -rf "${pkgdir}"/usr/share/man/man3/curl*
  rm -rf "${pkgdir}"/usr/share/man/man3/CURL*
  rm -rf "${pkgdir}"/usr/share/man/man1/curl*
  rm -rf "${pkgdir}"/usr/share/aclocal/libcurl*
  rm -rf "${pkgdir}"/usr/lib/libcurl*
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libcjson.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libcurl.pc
}
