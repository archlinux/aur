# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=2.1.26698.20241014
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="http://touptek.com/download/showdownload.php?lang=en&id=28"
depends=(fontconfig dbus libglvnd libxrender freetype2)
license=('custom')
source_x86_64=("ToupTekToupLite.x64-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/software/ToupTekToupLite.x64.tar.bz2")
source_i686=("ToupTekToupLite.x86-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/software/ToupTekToupLite.x86.tar.bz2")
sha256sums_i686=('8c47ccd8d42a7302db2027996777eeeb65f5398dd53cf82650bb38e06c3b8762')
sha256sums_x86_64=('871db8f94d698d01244b221e1c65647d3bb2acd91d8f0e8aa11e4e221077b3ac')
options=('!strip')

prepare() {
  ARCH_STR=$( [ "$CARCH" == "x86_64" ] && echo -n x64 || echo -n x86 )
  sed -n -e '1,/^exit 0$/!p' ToupTekToupLite.${ARCH_STR}.sh | tar xvz
  #rm -f ToupTekToupLite.${ARCH_STR}.sh
}

package() {
  install -Dm755 ToupLite -t "${pkgdir}/usr/local/ToupLite/"
  install -Dm644 libtoupcam.so libtoupnam.so -t "${pkgdir}/usr/local/ToupLite"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/usr/local/ToupLite/ToupLite" "${pkgdir}/usr/bin/ToupLite"

  install -Dm644 i18n/*.xml -t "${pkgdir}/usr/local/ToupLite/i18n/"
  install -Dm644 ToupLite.png -t "${pkgdir}/usr/local/ToupLite/"
  install -Dm644 99-toupcam.rules -t "${pkgdir}/usr/lib/udev/rules.d/"

  install -Dm755 ToupLite.desktop -t "${pkgdir}/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:
