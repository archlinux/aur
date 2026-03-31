# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Tom <reztho at archlinux dot us>

pkgname=pdfsam
_pkgname=pdfsam-basic
pkgver=6.0.0
pkgrel=1
pkgdesc="A free open source tool to split and merge pdf documents"
arch=('any')
url="https://www.pdfsam.org/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'java-runtime=25' 'sh' 'archlinux-java-run')
makedepends=('desktop-file-utils' 'gendesk')
source=("https://github.com/torakiki/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
        "pdfsam")
sha512sums=('6888c672beb1f0518224621fcd940b46c2087bf816f024b28c861efa4b3ec911e3566a40afdca11aab45725dc17ee0da2ae16f5f14bf4f64c2025b6cd3f7ba3f'
            'edfd2f1a529eab675dea7e17c149eb3a97ef5ea83ec6c8e8d26ffe988a29352f9f7c013dfff789785b37ca6cb4da30ae7b337536209c6a69976840355eb9cd3f')
noextract=("${pkgname}-${_pkgver}-linux-x64.tar.gz")

prepare() {
  mkdir -p "${pkgname}-${pkgver}-linux"
  bsdtar -xzf "${_pkgname}-${pkgver}-linux-x64.tar.gz" -C "${pkgname}-${pkgver}-linux"
  # create *.desktop file
  gendesk -f -n \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="PDFsam" \
          --categories="Office"

  # extract icons
  bsdtar -xf ${pkgname}-${pkgver}-linux/${_pkgname}-${pkgver}-linux-x64/lib/${_pkgname}-${pkgver}.jar images/basic
}

package() {
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}-linux/${_pkgname}-${pkgver}-linux-x64/lib/"* \
                 "${pkgdir}/usr/share/java/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}-linux/${_pkgname}-${pkgver}-linux-x64/splash.png" \
                 "${pkgdir}/usr/share/${pkgname}"

  # exec
  install -Dm755 "pdfsam" "${pkgdir}/usr/bin/pdfsam"

  # icons
  for _icon in 16 24 32 48 64 96 128 256 512; do
      install -Dm644 images/basic/${_icon}x${_icon}.png \
        "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png"
  done

  # desktop
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
