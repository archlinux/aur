# Maintainer: Egidio Caprino <me@egidiocaprino.it>

pkgname=dataloader
pkgver=37.0.0
pkgrel=1
pkgdesc="An easy to use graphical tool that helps you to get your data into Salesforce objects"
arch=('i686' 'x86_64')
url="https://developer.salesforce.com/page/Data_Loader"
license=("GPL2")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
makedepends=('git' 'maven')
install=dataloader.install
source=(dataloader.desktop dataloader.install dataloader.xpm)
source_i686=(git+https://github.com/forcedotcom/dataloader.git)
source_x86_64=(git+https://github.com/forcedotcom/dataloader.git)
md5sums=('b519f96b515793fa80cd820e25d70d68'
         '94f2b99bb9af44899cd4d2ded981fd54'
         '895815be928816f9ace42c3135a428b5')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  mvn clean package -D skipTests
}

package() {
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"

  cp -r "$srcdir/$pkgname" "$pkgdir/opt/"
  cp "$srcdir/dataloader.xpm" "$pkgdir/usr/share/icons/hicolor/48x48/apps/dataloader.xpm"

  touch "$pkgdir/opt/$pkgname/dataloader.sh"
  chmod +x "$pkgdir/opt/$pkgname/dataloader.sh"
  echo "#!/bin/bash" >> "$pkgdir/opt/$pkgname/dataloader.sh"
  echo "java -jar \"/opt/$pkgname/target/dataloader-$pkgver-uber.jar\"" >> "$pkgdir/opt/$pkgname/dataloader.sh"
  ln -s "/opt/$pkgname/dataloader.sh" "$pkgdir/usr/bin/dataloader"

  install -m 644 "$srcdir/dataloader.desktop" "$pkgdir/usr/share/applications/"
}

