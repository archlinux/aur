# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=grails
pkgver=2.2.0
pkgrel=2
pkgdesc='Groovy on rails, web framework'
arch=('any')
url="http://grails.org/"
depends=('java-environment' 'junit' 'bash' 'sh')
makedepends=('apache-ant' 'setconf')
optdepends=('groovy')
options=(!emptydirs)
license=('APACHE')
source=("http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/$pkgname-$pkgver.zip"
        "grails.sh")
sha256sums=('a92f63bf65c6d907e45c0a0aba8a0f5388e0035e906e312534891956264c2e75'
            '009f00755c1d5312f8ee4ad7e407e3b4a5328b6820e04b94b39750c43fe76d56')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Configuring paths...'
  setconf bin/grails DIRNAME /usr/share/grails
  setconf bin/grails-debug DIRNAME /usr/share/grails
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Packaging application...'
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname"

  msg2 'Packaging wrapper scripts...'
  install -Dm755 bin/startGrails \
    "$pkgdir/usr/share/$pkgname/startGrails"
  install -Dm755 "../grails.sh" \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "../grails.sh" \
    "$pkgdir/usr/share/$pkgname/bin/$pkgname"

  msg2 'Packaging icons...'
  cp media/icons/*.png "$pkgdir/usr/share/pixmaps/"
  
  msg2 'Packaging profile.d script...'
  echo "export GRAILS_HOME=/usr/share/grails" > grails.sh
  install -Dm755 grails.sh "$pkgdir/etc/profile.d/grails.sh"

  msg2 'Packaging license...'
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Cleaning up...'
  cd "$pkgdir/usr/share/$pkgname"
  # rm -rf doc
  rm -f INSTALL LICENSE README
  find "$pkgdir/usr/share" -name "*.bat" -exec rm {} \;
}

# vim:set ts=2 sw=2 et:
