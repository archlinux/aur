# Maintainer: Leo Verto <leotheverto+aur@gmail.com>
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard
pkgver=5.19
_pkgver=5_19
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('any')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('jre-openjdk')
source=("https://www.roomeqwizard.com/installers/REW_linux_$_pkgver.sh")
sha512sums=('9fa847163d89916585953a454ada58f2c940298fa6fedd7a5fc0290215691662f5ccd49d52205765e77e5a867a34050d71f82023498b646a6a329d1ed052b12f')

package() {
  sh REW_linux_$_pkgver.sh -q -dir "$pkgdir/opt/$pkgname"

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"

  ln -s "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/opt/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/opt/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # repair
  sed "s%$pkgdir%%g" -i "$pkgdir/opt/$pkgname/.install4j/response.varfile"
  sed "s%$pkgdir%%g" -i "$pkgdir/opt/$pkgname/.install4j/install.prop"

  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  sed "s/REW/Room EQ Wizard/g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # basic cleanup
  rm -rf "$pkgdir/opt/$pkgname/.install4j/files.log"
  rm -rf "$pkgdir/opt/$pkgname/.install4j/installation.log"
  rm -rf "$pkgdir/opt/$pkgname/.install4j/uninstall.png"
  rm -rf "$pkgdir/opt/$pkgname/uninstall"
}
