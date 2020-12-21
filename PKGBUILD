# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=2.1.18081.20201206
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="http://touptek.com/download/showdownload.php?lang=en&id=28"
depends=(fontconfig dbus libglvnd libxrender freetype2)
license=('custom')
source_x86_64=("ToupTekToupLite.x64-${pkgver}.tar.bz2"::"http://www.touptek.com/upload/download/ToupTekToupLite.x64.tar.bz2")
source_i686=("ToupTekToupLite.x86-${pkgver}.tar.bz2"::"http://www.touptek.com/upload/download/ToupTekToupLite.x86.tar.bz2")
sha256sums_i686=('b2b113f8679ea3d5cf37cbfb510cd3599346971fbbdb3c1caadb2bc25af3f4dc')
sha256sums_x86_64=('4cc8421e9b3bb7ec2b7cf3589362ddc377c9f6e903f2ba0a0ed5d940dfbfaf05')
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
