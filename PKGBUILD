# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kyoutubetomp3
pkgver=4.5.4.4870
pkgrel=1
pkgdesc="Extract audio from YouTube, Vimeo, Facebook and other online video hosting services"
arch=('x86_64')
url="https://www.4kdownload.com/products/product-youtubetomp3"
license=('custom:eula')
depends=('openssl' 'glib2' 'expat')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.svg"
        "fix_symlink_path.patch")
sha256sums=('2b6c956fa077dcdbee1855c1ae24bdfbf155335e7532836029d2911515e8a95d'
            '6c770835b19d7d6207be520bf1da7c2bc1c1fc58c438a797989db969e0951c24'
            '1f494b52aaf51e3500646315c6f8c46bc5fe0dde60c47e9dbe311c37c0c7821c'
            '1bc2c992e21bae6c51f3176f4c3e04577b3297ea98ffc45fb56ce802423cf6cb')

prepare() {
  cd "${pkgname}"
  # Remove insecure RPATH
  chrpath --delete "${pkgname}-bin"
  # Fix symlink path
  patch -p1 -i "${srcdir}/fix_symlink_path.patch"
}

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install icon file
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.svg"
  # Install files
  install -m 755 -d "${pkgdir}/usr/lib"
  cp -r "${pkgname}" "${pkgdir}/usr/lib"
  chown root:root "${pkgdir}/usr/lib/${pkgname}"
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/doc/eula"
}
