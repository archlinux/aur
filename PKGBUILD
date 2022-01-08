# Maintainer: Leo Verto <leotheverto+aur@gmail.com>
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard
pkgver=5.20.4
_pkgver=5_20_4
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('any')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('jre-openjdk')
source=("https://www.roomeqwizard.com/installers/REW_linux_$_pkgver.sh")
sha512sums=('6e130a77e7adc8ff13a2d99e5aadad19868b38ff08ed1d29e9f35223a712c1fe73fa7345a5fdf6b510d451688f685ab5c7aa12537dabc182a110b68bcc3b430b')

package() {
  sh REW_linux_$_pkgver.sh -q -dir "$pkgdir/opt/$pkgname"

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"

  ln -s "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/opt/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  cp -L "$pkgdir/opt/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  rm "$pkgdir/opt/$pkgname/REW.desktop"

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
