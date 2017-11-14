# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Tinxy <arch æŧ tinx ðøŧ eu>

_basename=scenebuilder
_appname=gluon-$_basename
pkgname=javafx-$_appname
pkgver=8.4.1
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX by Gluon"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
depends=('java-environment>=8' 'java-openjfx')
makedepends=('mercurial' 'gradle')
conflicts=('gluon-scenebuilder')
source=($_basename::hg+https://bitbucket.org/gluon-oss/scenebuilder#tag=$pkgver
        $_appname.sh
        $_appname.desktop)
sha512sums=('SKIP'
            '2a9dffb0b000ab838455b1846ed760c6a2bca92ac4a2d9cd2b5f064482718d16c89674fec5c32f1049497ec88e924da68af97c59530beede2b6c5e5183b0168c'
            'edbf2d545fb829ec2870b09937a94a951bb53eba894e407acbcb1161693e3077ff2eac07237551c0a97b037b83f62804dd03c33f6ffa5a9b40f9d47c80dcddf8')

prepare() {
  msg2 "Correcting build version..."
  sed -i "$srcdir/$_basename/build.gradle" -e "s/8.5.0-SNAPSHOT/$pkgver/"
}

build() {
  cd $srcdir/$_basename

  ./gradlew shadowJar
}

package() {
  cd $srcdir

  install -Dm 755 $_basename/app/build/libs/$_basename-$pkgver-all.jar $pkgdir/opt/$_appname/$_appname.jar
  install -Dm 755 $_appname.sh $pkgdir/usr/bin/$_appname
  install -Dm 644 $_appname.desktop $pkgdir/usr/share/applications/$_appname.desktop
  install -Dm 644 $_basename/app/src/main/resources/com/oracle/javafx/$_basename/app/about/$_basename-logo.png $pkgdir/usr/share/pixmaps/$_appname.png
  install -Dm 644 $_basename/app/build/resources/main/LICENSE $pkgdir/usr/share/licenses/$_appname/LICENSE
}
