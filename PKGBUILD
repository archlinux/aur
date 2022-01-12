# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ivan Agarkov <ivan.agarkov@gmail.com>

pkgname=heli-x
pkgver=10.0.2465
pkgrel=4
pkgdesc="Professional R/C Flight Simulator"
arch=('i686' 'x86_64')
url="https://www.heli-x.info"
license=('custom')
depends=('archlinux-java-run' 'java-runtime>=11' 'hicolor-icon-theme')
makedepends=('icoutils')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/${pkgver##*.}/HELI-X${pkgver%%.*}.tar.gz"
        "$pkgname-$pkgver-manual_de.pdf::$url/help${pkgver%%.*}/BedienungsanleitungV${pkgver%%.*}.pdf"
        "$pkgname-$pkgver-manual_en.pdf::$url/help${pkgver%%.*}/UsersManualV${pkgver%%.*}.pdf"
        "$pkgname-wrapper.sh"
        "$pkgname.desktop"
        "$pkgname-server.desktop")
sha512sums=('99c74a4f628b0d25a082b8685e6c1869c94142233e703914313fd2da5984c1c1d1444627588c1a84ed2144e94dbaa8d1bb0e830ce350bf57f1957ac6250d42bc'
            'b8d49650284a8b7b05bc65aaed1c2bc3219cfa448165fb90b5953e2ad92a716a7543d1fb9da258162bf3541e116a7d59fc9235fdada263e8b5ff878cc4a35f31'
            '32cca4e3a8fcdee8553931b82bf867bfdf20594b02cce8125ad8967ed56f5d10405490dc9c12f50a4a37f8c280f4dfd843a228e09cf7ec7250ae7724de207b5b'
            'b6b318c787c45602f0f1cfe1e30edfc56a2fec4fd98d8add9715ef950a9355dee0f5267378a4f4aade487bb75e26150b87ece9481278dee8c20775ca01669a90'
            '36af9602ad6b4654dba7651851ee51acf062a76824dc584fbb2e836e1438199ae5ee187d76b5cb56d8c260bce7ecdefa67e973d003678c3ed3ad3c107fa9c09d'
            '8be08b65cdc9007f4d39ab7a327a407bc7162d8d091d3e44294e11ddc6903151e35eb9999082332439b065ccac6ed6cb39bb2f0dae315483b00c9580e2184010')

prepare() {
  cd "HELI-X${pkgver%%.*}"
  local s="[[:space:]]"

  # Use an installed java runtime engine instead of the provided one
  rm -rf Java
  sed -i \
    -e 's|./Java/jre[0-9]\+/bin/java|JAVA_HOME=$(archlinux-java-run --min 11 --java-home) \&\& \\\n"$JAVA_HOME"/bin/java|' \
    runHELI-X.sh runHELI-X-Server.sh

  # Use a local writable home path for config files and resources
  sed -i \
    -e "/\/bin\/java/{s/$s*$//}" \
    -e "/\/bin\/java/{s|\(.*\)$s|\1 -DheliX.path.home=\"\$HOME/.heli-x\" |}" \
    runHELI-X.sh runHELI-X-Server.sh
}

package() {
  install -d -m755 "$pkgdir/opt/"
  cp -R HELI-X${pkgver%%.*} "$pkgdir/opt/$pkgname"

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
