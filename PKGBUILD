# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=2.2.1
pkgrel=1
pkgdesc='Groovy on rails, web framework'
arch=('any')
url="http://grails.org/"
makedepends=('apache-ant' 'setconf')
optdepends=('groovy: the groovy programming language'
            'grails-docs: documentation for grails')
options=(!emptydirs)
license=('APACHE')
source=("http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/$pkgname-$pkgver.zip"
        "grails.sh")
sha256sums=('4ec22ff45718a0f4948261f15f7c46e67ab0c2294d83d6c3eddb110d00f9af1d'
            '009f00755c1d5312f8ee4ad7e407e3b4a5328b6820e04b94b39750c43fe76d56')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Configuring paths...'
  setconf bin/grails DIRNAME /usr/share/grails
  setconf bin/grails-debug DIRNAME /usr/share/grails
}

package_grails() {
  depends=('java-environment' 'junit' 'bash' 'sh')

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
  rm -rf doc
  rm -f INSTALL LICENSE README
  find "$pkgdir/usr/share" -name "*.bat" -exec rm {} \;
}

package_grails-docs() {
  pkgdesc='Documentation for Grails'
  cd "$srcdir/grails-$pkgver"

  msg2 'Packaging documentation...'
  mkdir -p "$pkgdir/usr/share/doc"
  cp -r doc "$pkgdir/usr/share/doc/grails-$pkgver"
  mkdir -p "$pkgdir/usr/share/grails"
  ln -s "/usr/share/doc/grails-$pkgver" "$pkgdir/usr/share/grails/doc"
}

# vim:set ts=2 sw=2 et:
