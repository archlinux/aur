# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=2.1.26523.20240917
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="http://touptek.com/download/showdownload.php?lang=en&id=28"
depends=(fontconfig dbus libglvnd libxrender freetype2)
license=('custom')
source_x86_64=("ToupTekToupLite.x64-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/software/ToupTekToupLite.x64.tar.bz2")
source_i686=("ToupTekToupLite.x86-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/software/ToupTekToupLite.x86.tar.bz2")
sha256sums_i686=('ed1ceb19a1cf1edf88222a6fab1da181d9c1b63071cab80128db30eb6db727c5')
sha256sums_x86_64=('ed75739741ed7bed82c5123249ac5cb1d7d46fe3dbac4a2b870dc89b5f4febfa')
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
