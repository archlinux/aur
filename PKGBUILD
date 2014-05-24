# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=2.4.0
pkgrel=1
pkgdesc='Groovy on rails, web framework'
arch=('any')
url='http://grails.org/'
license=('APACHE')
makedepends=('apache-ant' 'unzip')
optdepends=('groovy: the groovy programming language'
            'grails-docs: documentation for grails')
options=('!emptydirs')
noextract=("${pkgname[1]}-$pkgver.zip")
source=("http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/${pkgname[0]}-$pkgver.zip"
        "http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/${pkgname[1]}-$pkgver.zip"
        "$pkgbase.sh")
sha256sums=('5526764443a252530efcf2d7e7e9c566ff08d595ecdc76534ac611d7ae7ebf7d'
            'c5ec90cfc12c39528830629178b5ab70ae7253a3cb41b993ee5a9d1d4b984b08'
            '15553ae56fd39f049edfa65a05413ef6d68ae37ed1ccc69570bf81e888239bf4')

prepare() {
  cd "${pkgname[0]}-$pkgver"

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
