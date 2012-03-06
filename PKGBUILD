# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=grails
pkgver=2.0.1
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
sha256sums=('18f274ef3520c1ae128aab1a41c5f8b6553494fd85dfaff6b89965af10c47e93'
            '009f00755c1d5312f8ee4ad7e407e3b4a5328b6820e04b94b39750c43fe76d56')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Configuring paths..."
  setconf bin/grails DIRNAME /usr/share/grails
  setconf bin/grails-debug DIRNAME /usr/share/grails
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Packaging executables..."
  install -Dm755 bin/grails-debug \
    "$pkgdir/usr/share/$pkgname/bin/grails-debug"
  install -Dm755 bin/startGrails \
    "$pkgdir/usr/share/$pkgname/startGrails"
  install -Dm755 "$srcdir/grails.sh" \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/grails.sh" \
    "$pkgdir/usr/share/$pkgname/bin/$pkgname"

  msg2 "Packaging jars..."
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r $srcdir/$pkgname-$pkgver/lib \
    "$pkgdir/usr/share/$pkgname/"
  cp -r $srcdir/$pkgname-$pkgver/dist \
    "$pkgdir/usr/share/$pkgname/"

  msg2 "Packaging class and sourcefiles..."
  mkdir -p "$pkgdir/usr/share/$pkgname/target/"
  cp -r "$srcdir/$pkgname-$pkgver/src" \
    "$pkgdir/usr/share/$pkgname/"

  msg2 "Packaging icons..."
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp $srcdir/$pkgname-$pkgver/media/icons/*.png \
    "$pkgdir/usr/share/pixmaps/"

  msg2 "Packaging plugins..."
  mkdir -p "$pkgdir/usr/share/$pkgname/plugins/"
  cp $srcdir/$pkgname-$pkgver/plugins/*.zip \
    "$pkgdir/usr/share/$pkgname/plugins/"

  msg2 "Packaging scripts..."
  mkdir -p "$pkgdir/usr/share/$pkgname/scripts/"
  cp $srcdir/$pkgname-$pkgver/scripts/*.groovy \
    "$pkgdir/usr/share/$pkgname/scripts/"
  cp "$srcdir/$pkgname-$pkgver/scripts/log4j.properties" \
    "$pkgdir/usr/share/$pkgname/scripts/"

  msg2 "Packaging settings and configuration files..."
  mkdir -p "$pkgdir/usr/share/$pkgname/conf/"
  cp $srcdir/$pkgname-$pkgver/conf/* \
    "$pkgdir/usr/share/$pkgname/conf/"
  echo "export GRAILS_HOME=/usr/share/grails" \
    > "$srcdir/$pkgname-$pkgver/grails.sh"
  install -Dm755 "$srcdir/$pkgname-$pkgver/grails.sh" \
    "$pkgdir/etc/profile.d/grails.sh"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build.properties" \
    "$pkgdir/usr/share/$pkgname/build.properties"
  install -Dm644 "$srcdir/$pkgname-$pkgver/src/grails/ant/build.xml" \
    "$pkgdir/usr/share/$pkgname/build.xml"

  msg2 "Packaging license..."
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
