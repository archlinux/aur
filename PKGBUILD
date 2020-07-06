# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=2.1.17309.2020616
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="http://touptek.com/download/showdownload.php?lang=en&id=28"
depends=(fontconfig dbus libglvnd libxrender freetype2)
license=('custom')
source_x86_64=("http://www.touptek.com/upload/download/ToupTekToupLite.x64.tar.bz2")
source_i686=("http://www.touptek.com/upload/download/ToupTekToupLite.x86.tar.bz2")
sha256sums_x86_64=('fdeabe108b4cfcb22aaf7a07dd94d65b215bf098657dd8174b0176ef2e09bb3f')
sha256sums_i686=('640fc3132181a6ae08a56ff6c466e87af45dd8d6ed8dc0b6e18fbafab05e8fa4')
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
