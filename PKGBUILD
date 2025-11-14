# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=autenticacao-gov-pt-bin
pkgver=3.14.0
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
         'openpace-git'
         'openssl-1.1'
         'ccid'
         'libzip'
         'openjpeg2'
         'poppler-qt5'
         'poppler'
         'xerces-c'
         'libxerces-c-3.2'
         'icu'
         'libnsl'
         'libcurl-compat'
         'xml-security-c')
makedepends=('zstd' 'tar' 'flatpak' 'ostree' 'patchelf')
optdepends=('plugin-autenticacao-gov-pt: Necessário para autenticações online'
'autenticacao-gov-pt-pki: PKI que confirma a validade dos certificados dos CC'
'ecce-gov-pt-certificates: Certificados da ECCE - quem assina dos certificados contidos em cartaodecidadao-pki')
conflicts=('cartaodecidadao' 'cartaodecidadao-bin' 'autenticacao-gov-pt')
replaces=('cartaodecidadao-bin')

source_x86_64=("https://github.com/amagovpt/autenticacao.gov/releases/download/v${pkgver}/pteid-mw-${pkgver}-pcsclite-2.3.flatpak"
 "autenticacao-gov-pt-bin.install")

sha512sums_x86_64=('d8c0e7756490f9117050c0e39303d3da9adfe7c51953bdf1617520444e6030a53868c61ab2b16cc7da9561194c22284178e9084d7a66b18e80b0d52fb8b398b8'
                   'd38b9748f386fcf64f3f0cb717eccf7936c64f0e7b6370ae3b1b079902015ce56d3057afcf2877ca4eee38776269ac3642701803ba96b24a81cfccc9a4d3245f')

install='autenticacao-gov-pt-bin.install'

prepare() {
  rm -rf ${srcdir}/pteid
  rm -rf ${srcdir}/pteid_out
  mkdir -p pteid
  ostree init --repo=pteid --mode=bare-user
  ostree static-delta apply-offline --repo=pteid "pteid-mw-${pkgver}-pcsclite-2.3.flatpak"
  ostree checkout --repo=pteid -U $(basename $(echo pteid/objects/*/*.commit | cut -d/ -f3- --output-delimiter='' | tr -d '\0') .commit) pteid_out
}

package() {
  mkdir -p "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/usr/lib/"
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
  rm -rf "${pkgdir}"/usr/lib/libeac*
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libeac*
  rm -rf "${pkgdir}"/usr/lib/libcurl*
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libcjson.pc
  rm -rf "${pkgdir}"/usr/lib/pkgconfig/libcurl.pc
  #patch shared libraries, this needs to be revisited next release.
  patchelf --replace-needed libxml-security-c.so.20 libxml-security-c.so.30 "$pkgdir"/usr/lib/libpteidapplayer.so.*
}
