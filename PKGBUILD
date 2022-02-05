# Maintainer: 
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=freemind
pkgver=1.0.1
pkgrel=5
pkgdesc="A Java mindmapping tool"
arch=('any')
url="https://sourceforge.net/projects/freemind"
license=('GPL')
depends=('hicolor-icon-theme' 'java-runtime' 'libxtst')
makedepends=('libicns')
changelog=$pkgname.changelog
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-bin-max-$pkgver.zip
        $pkgname.desktop)
sha256sums=('005e815bf5d1867eadcaa89194df9952d986ace9eed0a3058c7ee6255799a60a'
            'eac8db98257fcb8ed9c76ec340af5f3233a4783b8fe1c57ef274b9e7d2b56ed5')

package() {
  cd "${srcdir}"

  for file in $(find lib plugins -type f); do
    install -Dm644 $file "${pkgdir}"/usr/share/freemind/$file
  done

  install -Dm755 "${srcdir}"/freemind.sh "${pkgdir}"/usr/share/freemind/freemind.sh
  install -Dm644 "${srcdir}"/patterns.xml "${pkgdir}"/etc/freemind/patterns.xml
  
  install -d "${pkgdir}"/usr/share/freemind/accessories
  install -Dm644 "${srcdir}"/accessories/* "${pkgdir}"/usr/share/freemind/accessories/
  install -Dm644 "${srcdir}"/doc/freemind.mm "${pkgdir}"/usr/share/freemind/doc/freemind.mm

# icon and .desktop file
  install -Dm644 "${srcdir}"/freemind.desktop "${pkgdir}"/usr/share/applications/freemind.desktop
  bsdtar -xf lib/freemind.jar images/FreeMindWindowIconModern.icns
  icns2png -x images/FreeMindWindowIconModern.icns -o images/
  for res in 16 32 128 256 512; do
    install -Dm644 images/FreeMindWindowIconModern_${res}x${res}x32.png \
      "${pkgdir}"/usr/share/icons/hicolor/${res}x${res}/apps/freemind.png
  done

# FS#49620 fix
  install -d "${pkgdir}"/usr/bin/
  ln -s /usr/share/freemind/freemind.sh "${pkgdir}"/usr/bin/$pkgname
}
