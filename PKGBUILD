# Maintainer: Benedikt Rumpf <beru@posteo.de> 
# Maintainer: Egidio Caprino <me@egidiocaprino.it>

pkgname=dataloader
pkgver=48.0.0
pkgrel=1
pkgdesc="An easy to use graphical tool that helps you to get your data into Salesforce objects"
arch=('i686' 'x86_64')
url="https://developer.salesforce.com/page/Data_Loader"
license=("GPL2")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
makedepends=('git' 'maven' 'jre11-openjdk')
install=dataloader.install
source=(dataloader.desktop dataloader.install dataloader.svg)
source_i686=(git+https://github.com/forcedotcom/dataloader.git)
source_x86_64=(git+https://github.com/forcedotcom/dataloader.git)
md5sums=('b519f96b515793fa80cd820e25d70d68'
         '94f2b99bb9af44899cd4d2ded981fd54'
         '0b9294d4865f364681a79fbbc73dd88a')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git checkout "tags/V$pkgver"
  echo "$pkgver"
}

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
  cp "$srcdir/dataloader.svg" "$pkgdir/usr/share/icons/hicolor/48x48/apps/dataloader.svg"

  touch "$pkgdir/opt/$pkgname/dataloader.sh"
  chmod +x "$pkgdir/opt/$pkgname/dataloader.sh"
  echo "#!/bin/bash" >> "$pkgdir/opt/$pkgname/dataloader.sh"
  echo "java -jar \"/opt/$pkgname/target/dataloader-$pkgver-uber.jar\"" >> "$pkgdir/opt/$pkgname/dataloader.sh"
  ln -s "/opt/$pkgname/dataloader.sh" "$pkgdir/usr/bin/dataloader"

  install -m 644 "$srcdir/dataloader.desktop" "$pkgdir/usr/share/applications/"
}
