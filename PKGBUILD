# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=2.1.26555.20240922
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="http://touptek.com/download/showdownload.php?lang=en&id=28"
depends=(fontconfig dbus libglvnd libxrender freetype2)
license=('custom')
source_x86_64=("ToupTekToupLite.x64-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/software/ToupTekToupLite.x64.tar.bz2")
source_i686=("ToupTekToupLite.x86-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/software/ToupTekToupLite.x86.tar.bz2")
sha256sums_i686=('ee976308fad813621396ae0cf095bdae6f201f1240fbb241deacbdf08a451ce4')
sha256sums_x86_64=('cdc611d33568f7511803eb43ed5a25e98b44db50a8b6e60a7e23db5c93f7780b')
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
