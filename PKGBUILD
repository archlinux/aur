# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=2.3.7
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
sha256sums=('6f3027dd235707f5ee7877daeeb6bc3a68543b0803ec518a19e614114a60a414'
            'a0448b4041c03932768fcf44935502f48cb44a0e292ac237b97b8411ede4b1e2'
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
