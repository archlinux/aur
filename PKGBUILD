# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Tom <reztho at archlinux dot us>

pkgname=pdfsam
pkgver=5.1.3
pkgrel=3
pkgdesc="A free open source tool to split and merge pdf documents"
arch=('any')
url="https://www.pdfsam.org/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'java-runtime=20' 'sh' 'archlinux-java-run')
makedepends=('desktop-file-utils' 'gendesk')
source=("https://github.com/torakiki/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux.tar.gz"
        "pdfsam")
sha512sums=('757a02ca1fa72b0303d46e1c5940a7a940d092914c3866e58fad4b1bcc21da582a9f8379906c58d3c6426cbdf931b979d0797419b46f1f3fac683480cc740ea6'
            'ec0703ff11e69e0d1dac5e1a4c8671d7994b340947cc1bbeed1ff80d598fd98ae4e74a9ac29489df8432336bf8b439e0fc18b8f295eb70f3a3f06d54cf6a8aa9')
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
  bsdtar -xf ${pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/lib/pdfsam-basic-${pkgver}.jar images/basic
}

package() {
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/lib/"* \
                 "${pkgdir}/usr/share/java/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}-linux/pdfsam-${pkgver}-linux/splash.png" \
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
