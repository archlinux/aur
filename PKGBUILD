# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Levente Polyak <anthraxx@archlinux.org>

pkgbase=grails
pkgname=(grails grails-docs)
pkgver=5.3.2
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
b2sums=('e01d5e93920709275a82a8f4916fed970d569132a7a1c55785a56047cbc2de594c41846f4f2ff24ba2acc72f1f6a3e5fa5fb76f91bc09c52fe1e35fdcf909376'
        '3cee73f63dadbea1f7a51ae63ce155ede6e307b2ac2f4588bc29affd1ab5a1b8f7a45a6b1c96b9d695d4c7f1405feb29fdea50b6f517423fc4d24664757a57dd')

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
