# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ivan Agarkov <ivan.agarkov@gmail.com>

pkgname=heli-x
pkgver=10.1.2561
pkgrel=1
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
sha512sums=('703211f196e47ecfbf4e4f6f4af14964b0c27e82772dd204bdbe95ad32b9bbb91190e804cefa6d1cd8bffaebe959d4c0ada21343a36ecde8bccb5114f69305da'
            '8772099f77d28c5937f66d1c28bce1e4e623ee565ed4c3b9e8aa11de579cbeda1539985a7c9ff4b374892a7b11f3001aac968fb01d4bc0c1494cb4a1129c06c1'
            '644ec254248c2d79209a240121563a5b4cc0b835bc2bf797cac16471f612ce2dc22b50cedfd8f9de2513ea3acd26b9e259fb3091b82eecb10876c428386d71dd'
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
