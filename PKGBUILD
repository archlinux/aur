# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=3.0.7
pkgrel=1
pkgdesc='Groovy on rails, web framework'
arch=('any')
url='http://grails.org/'
license=('APACHE')
makedepends=('apache-ant' 'unzip' 'setconf')
optdepends=('groovy: the groovy programming language'
            'grails-docs: documentation for grails')
options=('!emptydirs')
noextract=("${pkgname[1]}-$pkgver.zip")
source=("https://github.com/grails/grails-core/releases/download/v$pkgver/grails-$pkgver.zip"
        "https://github.com/grails/grails-doc/releases/download/v$pkgver/grails-docs-$pkgver.zip")
sha256sums=('d99b11e4a8fb1f5a155f1784f482316df96e63d094d5d083a62bc37905380800'
            '328b0179e43fbf2723cf9f7b2d2208289d5c1a39d0eeee7ab0c55b85febce2b8')

prepare() {
  cd "${pkgname[0]}-$pkgver"

  # profile.d script
  echo 'export GRAILS_HOME=/usr/share/grails' > "$srcdir/$pkgbase.profile"

  # set APP_HOME
  setconf bin/grails APP_HOME /usr/share/grails
}

package_grails() {
  depends=('java-environment' 'junit' 'bash')

  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/pixmaps/"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname"
  install -Dm755 bin/grails "$pkgdir/usr/bin/grails"
  cp media/icons/*.png "$pkgdir/usr/share/pixmaps/"
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

# getver: https://grails.org/download.html
# vim:set ts=2 sw=2 et:
