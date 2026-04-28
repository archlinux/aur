# Maintainer: zocker_160 <zocker1600 at posteo dot net>
# Maintainer: Benedikt Rumpf <beru@posteo.de>
# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=dataloader
_pkgname=salesforce-dataloader
pkgver=64.1.0
pkgrel=1
pkgdesc="An easy to use graphical tool that helps you to get your data into Salesforce objects"
arch=('x86_64')
url="https://github.com/forcedotcom/dataloader"
license=("BSD-3")
depends=('java-runtime>=17' 'swt-bin')
#depends=('java-runtime>=17' 'gtk2' 'swt-bin')
makedepends=('git' 'maven' 'java-runtime>=17')

source=(
  "$pkgname-$pkgver::git+https://github.com/forcedotcom/dataloader.git#tag=v$pkgver"
  "salesforce-dataloader.sh"
  "salesforce-dataloader.desktop"
  "salesforce-dataloader.svg"
)

sha256sums=('46ac72905a861a8dad639cde59a171fca81991173796b05e398e0f433e108aa4'
            '1f65612f9bfd972b98d68c193b92e0f30a5e6615d637d13ddf3d7904c91bc0d3'
            '5dc55bb70c25c987bb3688d9c0cc05e68866f9af34ec57d2ecf9b59403bc7f88'
            'a3139c41db1a8202bd67893b2de25f149b383bea1604a275806348e2dd3a8e22')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  mvn clean
  mvn -DskipTests -Dmaven.test.skip -Dtests.skip=false package
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/opt/$_pkgname"
  mkdir -p "$pkgdir/usr/bin/"

  install -D -m755 "salesforce-dataloader.sh" -t "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/salesforce-dataloader.sh" "$pkgdir/usr/bin/$_pkgname"

  install -D -m644 "salesforce-dataloader.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -D -m644 "salesforce-dataloader.desktop" -t "$pkgdir/usr/share/applications/"

  cd "$srcdir/$pkgname-$pkgver"

  install -D -m644 "license.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -D -m644 "target/dataloader-$pkgver.jar" "$pkgdir/opt/$_pkgname/dataloader.jar"

  # required because otherwise this fucking app thinks it needs to be installed first!!!
  # fucking Windows smoothbrain programming
  cp -r "src/main/resources/samples" "$pkgdir/opt/$_pkgname"
  ln -s /usr/share/java/swt.jar "$pkgdir/opt/$_pkgname/swtlinux_aarch64-4.36.jar" # yes yes I know fk stupid
  ln -s /usr/share/java/swt.jar "$pkgdir/opt/$_pkgname/swtlinux_x86_64-4.36.jar"
  ln -s /usr/share/java/swt.jar "$pkgdir/opt/$_pkgname/swt.jar" # the one that actually matters

  # YES I know this is fucking stupid
  touch "$pkgdir/opt/$_pkgname/dataloader.sh"
}
