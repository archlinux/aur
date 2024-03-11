# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=autenticacao-gov-pt-bin
pkgver=3.12.0
pkgrel=2
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
conflicts=('cartaodecidadao' 'cartaodecidadao-bin' 'autenticacao-gov-pt' 'openpace')
replaces=('cartaodecidadao-bin')

source_x86_64=("https://github.com/amagovpt/autenticacao.gov/releases/download/v3.12.0/pteid-mw-3.12.0.flatpak"
 "autenticacao-gov-pt-bin.install")

sha512sums_x86_64=('01fec7530b9c918e4d357a03152faa78754230e281eb3826355c4cc80163ad2653b71fd0846fdfd4078295f2f241d1c775376d95e94387feba8e097e9077f7fc'
                   'd38b9748f386fcf64f3f0cb717eccf7936c64f0e7b6370ae3b1b079902015ce56d3057afcf2877ca4eee38776269ac3642701803ba96b24a81cfccc9a4d3245f')

install='autenticacao-gov-pt-bin.install'

prepare() {
  rm -rf ${srcdir}/pteid
  rm -rf ${srcdir}/pteid_out
  mkdir -p pteid
  ostree init --repo=pteid --mode=bare-user
  ostree static-delta apply-offline --repo=pteid pteid-mw-3.12.0.flatpak
  ostree checkout --repo=pteid -U $(basename $(echo pteid/objects/*/*.commit | cut -d/ -f3- --output-delimiter='' | tr -d '\0') .commit) pteid_out
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
  rm -rf "${pkgdir}"/usr/share/man
  rm -rf "${pkgdir}"/usr/share/aclocal/libcurl*
  rm -rf "${pkgdir}"/usr/lib/libcurl*
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libcjson.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libcurl.pc
}
