# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=2.3.8
pkgrel=1
pkgdesc='Groovy on rails, web framework'
arch=('any')
url='http://grails.org/'
license=('APACHE')
makedepends=('setconf' 'apache-ant' 'unzip')
optdepends=('groovy: the groovy programming language'
            'grails-docs: documentation for grails')
options=('!emptydirs')
noextract=("${pkgname[1]}-$pkgver.zip")
source=("http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/${pkgname[0]}-$pkgver.zip"
        "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/${pkgname[1]}-$pkgver.zip"
        "$pkgbase.sh")
sha256sums=('7da33dc1c5095a06e9ede4c077670a63d99035f3901472cbf756d6a240d5fb04'
            '9548ee55604105429aac576a8b4c9ce2207ee0259541f2da80c3c49d0d4ac312'
            '15553ae56fd39f049edfa65a05413ef6d68ae37ed1ccc69570bf81e888239bf4')

prepare() {
  cd "${pkgname[0]}-$pkgver"

  # configure paths
  setconf bin/grails DIRNAME /usr/share/grails
  setconf bin/grails-debug DIRNAME /usr/share/grails

  # profile.d script
  echo 'export GRAILS_HOME=/usr/share/grails' > "$srcdir/$pkgbase.profile"
}

package_grails() {
  depends=('java-environment' 'junit' 'bash')

  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/pixmaps/"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname"

  # wrapper scripts
  install -Dm755 bin/startGrails \
    "$pkgdir/usr/share/$pkgname/startGrails"
  install -Dm755 "../$pkgname.sh" \
    "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "../$pkgname.sh" \
    "$pkgdir/usr/share/$pkgname/bin/$pkgname"

  # icons
  cp media/icons/*.png "$pkgdir/usr/share/pixmaps/"
  
  # profile.d script
  install -Dm755 "$srcdir/$pkgbase.profile" "$pkgdir/etc/profile.d/$pkgname.sh"

  # clean up
  cd "$pkgdir/usr/share/$pkgname"
  rm -rf doc INSTALL LICENSE README
  find "$pkgdir/usr/share" -name "*.bat" -exec rm {} \;
}

package_grails-docs() {
  pkgdesc='Documentation for Grails'

  install -d "$pkgdir/usr/share/doc" "$pkgdir/usr/share/grails"
  unzip "grails-docs-$pkgver.zip" -d "$pkgdir/usr/share/doc/grails-$pkgver"
  ln -s "/usr/share/doc/grails-$pkgver" "$pkgdir/usr/share/grails/doc"
}

# vim:set ts=2 sw=2 et:
