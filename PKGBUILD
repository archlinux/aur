# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=grails
pkgver=2.1.1
pkgrel=1
pkgdesc="Groovy on rails, web framework"
arch=('any')
url="http://grails.org/"
depends=('java-environment' 'junit' 'bash' 'sh')
makedepends=('apache-ant' 'setconf')
optdepends=('groovy')
options=(!emptydirs)
license=('APACHE')
source=("http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/$pkgname-$pkgver.zip"
        "grails.sh")
sha256sums=('d9c1425a0799754b45a110918422bde2c33a670f7b1410b51ccb0706af595b22'
            '009f00755c1d5312f8ee4ad7e407e3b4a5328b6820e04b94b39750c43fe76d56')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Configuring paths..."
  setconf bin/grails DIRNAME /usr/share/grails
  setconf bin/grails-debug DIRNAME /usr/share/grails
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Creating directories..."
  mkdir -p "$pkgdir/usr/share/pixmaps/" \
    "$pkgdir/usr/share/$pkgname/"{plugins,scripts,conf,target}

  msg2 "Packaging executables..."
  install -Dm755 bin/grails-debug \
    "$pkgdir/usr/share/$pkgname/bin/grails-debug"
  install -Dm755 bin/startGrails \
    "$pkgdir/usr/share/$pkgname/startGrails"
  install -Dm755 "../grails.sh" \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "../grails.sh" \
    "$pkgdir/usr/share/$pkgname/bin/$pkgname"

  msg2 "Packaging jars..."
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r lib "$pkgdir/usr/share/$pkgname/"
  cp -r dist "$pkgdir/usr/share/$pkgname/"

  msg2 "Packaging class and sourcefiles..."
  cp -r src "$pkgdir/usr/share/$pkgname/"

  msg2 "Packaging icons..."
  cp media/icons/*.png "$pkgdir/usr/share/pixmaps/"

  msg2 "Packaging plugins..."
  cp plugins/*.zip "$pkgdir/usr/share/$pkgname/plugins/"

  msg2 "Packaging scripts..."
  cp scripts/*.groovy "$pkgdir/usr/share/$pkgname/scripts/"
  cp scripts/log4j.properties "$pkgdir/usr/share/$pkgname/scripts/"

  msg2 "Packaging settings and configuration files..."
  cp conf/* "$pkgdir/usr/share/$pkgname/conf/"
  echo "export GRAILS_HOME=/usr/share/grails" > grails.sh
  install -Dm755 grails.sh "$pkgdir/etc/profile.d/grails.sh"
  install -Dm644 "build.properties" \
    "$pkgdir/usr/share/$pkgname/build.properties"
  install -Dm644 "src/grails/ant/build.xml" \
    "$pkgdir/usr/share/$pkgname/build.xml"

  msg2 "Packaging license..."
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
