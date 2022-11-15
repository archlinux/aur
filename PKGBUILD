# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Levente Polyak <anthraxx@archlinux.org>

pkgbase=grails
pkgname=(grails grails-docs)
pkgver=5.2.5
pkgrel=1
pkgdesc='Groovy on rails, a web framework'
url='https://grails.org/'
arch=(any)
license=(Apache)
makedepends=(apache-ant java-environment junit setconf unzip)
optdepends=('grails-docs: documentation for grails'
            'groovy: the groovy programming language')
options=(!emptydirs)
noextract=(${pkgname[1]}-$pkgver.zip)
source=(${pkgname[0]}-$pkgver.zip::https://github.com/grails/grails-core/releases/download/v$pkgver/grails-$pkgver.zip
        ${pkgname[1]}-$pkgver.zip::https://github.com/grails/grails-doc/releases/download/v$pkgver/grails-docs.zip)
b2sums=('8d26420cdeaaaca971940cdcf9eb9495a0e381ee5c7ab22ca9f1a50ad6a1d2baa24606ddef7c34f378311ef53eb29b80705cbcd4a7cd486ff4fff974e85a9825'
        '453330108ed6de5260cc2121f897d3a41f26aacfa3a61f1804d26077633381030f76fe87584517e7958a91e081ad92b5d0fc1998d2c6696103c111e51e8c4145')

prepare() {
  echo 'export GRAILS_HOME=/usr/share/grails' > $pkgbase.profile
  setconf $pkgbase-$pkgver/bin/grails APP_HOME /usr/share/grails
}

package_grails() {
  depends=(bash java-environment junit)

  install -Dm755 $pkgbase.profile "$pkgdir/etc/profile.d/$pkgname.sh"
  cd $pkgbase-$pkgver
  install -d "$pkgdir/usr/share/pixmaps"
  cp -r . "$pkgdir/usr/share/$pkgname"
  install -Dm755 bin/grails "$pkgdir/usr/bin/grails"
  install -Dm644 media/icons/*.png -t "$pkgdir/usr/share/pixmaps"

  # clean up
  rm -rf "$pkgdir/usr/share/$pkgname/"{doc,INSTALL,LICENSE,README}
  find "$pkgdir/usr/share" -name "*.bat" -exec rm {} \;
}

package_grails-docs() {
  pkgdesc='Documentation for Grails'
  install -d "$pkgdir/usr/share/doc" "$pkgdir/usr/share/grails"
  unzip grails-docs-$pkgver.zip -d "$pkgdir/usr/share/doc/grails-$pkgver"
  ln -s "/usr/share/doc/grails-$pkgver" "$pkgdir/usr/share/grails/doc"
}
