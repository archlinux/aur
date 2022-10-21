# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Tom <reztho at archlinux dot us>

pkgname=pdfsam
pkgver=4.3.4
pkgrel=1
pkgdesc="A free open source tool to split and merge pdf documents"
arch=('any')
url="https://www.pdfsam.org/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'java-runtime=11' 'sh')
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

sha512sums=('a992638841bf9b6b2fac2956fed41235642d43b56d6fc072c810da40ac898be7b7c26d932058fb232c45149e7af068cf772fc2ff6ea568b9dda6ae0ac2e971ce'
            'ed56a87487a9f7e512e69203fe10304dd4187618ae2f06069f5381b8576888021fd2e9044369c216a661509fa622de4e1e3a67ad1f79b6d72a11a7aaa45e0a3c')
