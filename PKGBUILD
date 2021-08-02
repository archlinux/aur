# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Tom <reztho at archlinux dot us>

pkgname=pdfsam
pkgver=4.2.6
pkgrel=1
pkgdesc="A free open source tool to split and merge pdf documents"
arch=('any')
url="https://www.pdfsam.org/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'java-environment>=11' 'sh')
makedepends=('desktop-file-utils' 'gendesk')
source=("https://github.com/torakiki/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux.tar.gz"
        "pdfsam")
noextract=("${pkgname}-${pkgver}-linux.tar.gz")

prepare() {
  mkdir -p "${pkgname}-${pkgver}-linux"
  bsdtar -xzf "${pkgname}-${pkgver}-linux.tar.gz" -C "${pkgname}-${pkgver}-linux"
  # create *.desktop file
  gendesk -f -n \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="PDFsam" \
          --categories="Office"

  # extract icons
  bsdtar -xf ${pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/pdfsam-basic-${pkgver}.jar images/basic
}

package() {
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -Dm644 "${pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/pdfsam-basic-${pkgver}.jar" \
                 "${pkgdir}/usr/share/java/${pkgname}/"
  install -Dm644 "${pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/lib/"* \
                 "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -Dm755 "${pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/bin/pdfsam.sh" \
                 "${pkgdir}/usr/share/java/${pkgname}/bin/pdfsam.sh"

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

sha512sums=('5b85e3cceb02452602995543f854e0b1212e30b16de340d0b554e0e18e26536058aa81505f901d2eb1cecad9bc281e026e300068bea37c4f94f4ab418fcdb25a'
            'c0d8665e8f0a82e539cd70972f95f819d13b10166f1e4bb04d032d108ef5de45fe77f8716e8e2f0fa129e7042907928bde1d947cc54f691aa6d87a76dfaa10c1')
