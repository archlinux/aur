# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="PDFEncrypt"
pkgname="${_name,,}"
pkgver=1.1.8461.14277
pkgrel=1
pkgdesc="A free, open-source Windows application to encrypt existing PDF documents"
arch=('x86_64')
url="https://pdfencrypt.net"
_url="https://github.com/ryangriggs/${_name}"
license=('AGPL-3.0-or-later')
depends=('sh' 'wine' 'wine-mono')
makedepends=('icoutils' 'imagemagick')
_pkgsrc="${pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${pkgname}.sh"
        "${pkgname}.desktop")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/Release.zip")
noextract=("${_pkgsrc}-x86_64.zip")
b2sums=('2539afdc973ee8610353a01f2bbbf5ba6265e05ffa785ab2965d58112b30a33b348f22a51abe89e89cba4e1c62814d8d6e767047d6055e116089252e51e5cbb9'
        '634c28ed47ae34c8cf6c5ae355c9ac5c86c0ff736f19b34a3acc2e85a9c9b0ad3978d6378882ac26c29ab09ab09622f85e9719aa71a5b77709c84a9d046dbe22'
        'bfa465cdec1cd22722ef3a9a997b0fc1aa3e8eb9e7dc11bd0cd36d40eba0f2c47e645493f18a3ed71fec9e1a6deb671c8c484ffcd6ee2163ed949366f9d050c8')
b2sums_x86_64=('b0770beaf88874a91dd33e50d8bca71c41a8f6029c6c0cf55f84becdf3b58e12d1a109fabb64e59ea95a9688c8c53df969923caf85666d4750df2023d34b16b9')
options=('!debug' '!strip')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.zip" -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  wrestool -x --output="${pkgname}.ico" -t14 "${_name}.exe"
  magick "${pkgname}.ico" "${pkgname}.png"

  rm -f *.pdb
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
 
  cd "${_pkgsrc}-${CARCH}"
  install -vd "${pkgdir}/usr/share/${pkgname}"
  cp -vrf *.exe *.dll *.xml *.config "${pkgdir}/usr/share/${pkgname}/"

  install -vDm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  cd "${pkgdir}/usr/share/${pkgname}"
  find . -type f -exec chmod 644 "{}" \;
  find . -type d -exec chmod 755 "{}" \;
}
