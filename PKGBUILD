# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ivan Agarkov <ivan.agarkov@gmail.com>

pkgname=heli-x
pkgver=10.0.2465
pkgrel=2
pkgdesc="Professional R/C Flight Simulator"
arch=('i686' 'x86_64')
url="https://www.heli-x.info"
license=('custom')
depends=('java-runtime=11' 'hicolor-icon-theme')
makedepends=('icoutils')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/${pkgver##*.}/HELI-X${pkgver%%.*}.tar.gz"
        "$pkgname-$pkgver-manual_de.pdf::$url/help${pkgver%%.*}/BedienungsanleitungV${pkgver%%.*}.pdf"
        "$pkgname-$pkgver-manual_en.pdf::$url/help${pkgver%%.*}/UsersManualV${pkgver%%.*}.pdf"
        "$pkgname-wrapper.sh"
        "$pkgname.desktop"
        "$pkgname-server.desktop")
sha512sums=('22e2323e71396dc38d94142ef6235b1002fec094ab00fbdc5dae59fd5863c5692ab4c8491f21af7c0a48588c368d339d6019f0fe91ade57fa790b55d13ddcb87'
            'b8d49650284a8b7b05bc65aaed1c2bc3219cfa448165fb90b5953e2ad92a716a7543d1fb9da258162bf3541e116a7d59fc9235fdada263e8b5ff878cc4a35f31'
            '32cca4e3a8fcdee8553931b82bf867bfdf20594b02cce8125ad8967ed56f5d10405490dc9c12f50a4a37f8c280f4dfd843a228e09cf7ec7250ae7724de207b5b'
            'b834a975473b499b6924f0dd9b5ee6d463e94d2bc5232dd08e35b72bca0d862db44ca03bd64efee875e61f3b14162280f6daf79ed8c4c48a4e528e3e017cd33a'
            '36af9602ad6b4654dba7651851ee51acf062a76824dc584fbb2e836e1438199ae5ee187d76b5cb56d8c260bce7ecdefa67e973d003678c3ed3ad3c107fa9c09d'
            '8be08b65cdc9007f4d39ab7a327a407bc7162d8d091d3e44294e11ddc6903151e35eb9999082332439b065ccac6ed6cb39bb2f0dae315483b00c9580e2184010')

prepare() {
  cd "HELI-X${pkgver%%.*}"
  local s="[[:space:]]"

  # Use an installed java runtime engine instead of the provided one
  rm -rf Java
  sed -i "s|./Java/jre11/bin/java|java|" runHELI-X.sh runHELI-X-Server.sh

  # Use a local writable home path for config files and resources
  sed -i \
    -e "/java$s*-/{s/$s*$//}" \
    -e "/java$s*-/{s|\(.*\)$s|\1 -DheliX.path.home=\"\$HOME/.heli-x\" |}" \
    runHELI-X.sh runHELI-X-Server.sh
}

package() {
  install -d -m755 "$pkgdir/usr/share/"
  cp -R HELI-X${pkgver%%.*} "$pkgdir/usr/share/$pkgname"

  icotool -x HELI-X${pkgver%%.*}/runHeli-X.ico
  for res in {16,32,48,128,256}; do
    install -Dm644 runHeli-X_*_${res}x${res}x32.png "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
  done

  install -Dm755 $pkgname-wrapper.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname*.desktop -t "$pkgdir/usr/share/applications/"

  install -Dm644 $pkgname-$pkgver-manual_en.pdf "$pkgdir/usr/share/doc/$pkgname/manual_en.pdf"
  install -Dm644 $pkgname-$pkgver-manual_de.pdf "$pkgdir/usr/share/doc/$pkgname/manual_de.pdf"

  cd "HELI-X${pkgver%%.*}"
  install -Dm644 libs/HeliX/license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 libs/HeliX/license_e.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
