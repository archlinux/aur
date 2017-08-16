# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=1.0
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="http://touptek.com/download/showdownload.php?lang=en&id=28"
depends=('qt4')
license=('unknown')
source=("http://touptek.com//upload/download/ToupLiteLinux.tgz")
md5sums=('7532b402b30adfe613d1356478c30892')

prepare() {
  cd "$srcdir"

  if [ "$CARCH" == "x86_64" ]
  then
      chmod u+rw ToupLite-${pkgver}-x64.tgz
      tar xvzf ToupLite-${pkgver}-x64.tgz
      tail -n +41 ToupLite-${pkgver}-x64.run | tar xvz
  else
      chmod u+rw ToupLite-${pkgver}-x86.tgz
      tar xvzf ToupLite-${pkgver}-x86.tgz
      tail -n +41 ToupLite-${pkgver}-x86.run | tar xvz
  fi

  cd ToupLite
  tar xzvf res.tar.gz
}

package() {
  cd "$srcdir/ToupLite"

  install -Dm644 libtoupcam.so libtoupnam.so -t "${pkgdir}/usr/local/lib"
  install -Dm755 ToupLite "${pkgdir}/usr/local/ToupLite/ToupLite"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/local/ToupLite/ToupLite" "${pkgdir}/usr/bin/ToupLite"

  install -Dm644 res/*.xml res/ToupLite.png -t "${pkgdir}/usr/local/ToupLite/res/"
  install -Dm644 99-toupcam.rules -t "${pkgdir}/usr/lib/udev/rules.d/"

  install -Dm755 res/ToupLite.desktop -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
