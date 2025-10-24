# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Tom <reztho at archlinux dot us>

pkgname=pdfsam
_pkgname=pdfsam-basic
pkgver=5.4.1
pkgrel=1
pkgdesc="A free open source tool to split and merge pdf documents"
arch=('any')
url="https://www.pdfsam.org/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'java-runtime=21' 'sh' 'archlinux-java-run')
makedepends=('desktop-file-utils' 'gendesk')
source=("https://github.com/torakiki/${pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
        "pdfsam")
sha512sums=('c1f9df2fcfe93911dba443e6a00d8831bfb87879a1865ef42ada48622b1e2930fb8f87c2fdc666e0b2cb13a985bba96378ed873b306bcd4b205aecf0c2e8ec3e'
            '700700b8ad4fb44f6eb1aaff35ede7ac53729c0dce39f23467159b14aadd28705cf5c547c6b8871ecd4afebc1fb479eafdbdad68b95c0114e26438961abf8209')
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
