# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=2.1.19728.20211022
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="http://touptek.com/download/showdownload.php?lang=en&id=28"
depends=(fontconfig dbus libglvnd libxrender freetype2)
license=('custom')
source_x86_64=("ToupTekToupLite.x64-${pkgver}.tar.bz2"::"http://www.touptek.com/upload/download/ToupTekToupLite.x64.tar.bz2")
source_i686=("ToupTekToupLite.x86-${pkgver}.tar.bz2"::"http://www.touptek.com/upload/download/ToupTekToupLite.x86.tar.bz2")
sha256sums_i686=('27a28e2d1cec24651e78f3a8219446ab6175cb845c528660dc71217f2529a432')
sha256sums_x86_64=('bd67f263f3c0b3f87825c1e274e0b34331083fa9a6216f2b6d66ace36bb21c96')
options=('!strip')

prepare() {
  ARCH_STR=$( [ "$CARCH" == "x86_64" ] && echo -n x64 || echo -n x86 )
  sed -n -e '1,/^exit 0$/!p' ToupTekToupLite.${ARCH_STR}.sh | tar xvz
  rm -f ToupTekToupLite.${ARCH_STR}.sh
}

package() {
  install -Dm755 touplite "${pkgdir}/usr/local/ToupLite/touplite"
  install -Dm644 libtoupcam.so libtoupnam.so -t "${pkgdir}/usr/local/ToupLite"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/usr/local/ToupLite/touplite" "${pkgdir}/usr/bin/touplite"

  install -Dm644 i18n/*.xml -t "${pkgdir}/usr/local/ToupLite/i18n/"
  install -Dm644 touplite.png -t "${pkgdir}/usr/local/ToupLite/"
  install -Dm644 99-toupcam.rules -t "${pkgdir}/usr/lib/udev/rules.d/"

  install -Dm755 touplite.desktop -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
