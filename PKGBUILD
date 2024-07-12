# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Levente Polyak <anthraxx@archlinux.org>

pkgbase=grails
pkgname=(grails grails-docs)
pkgver=6.0.0
pkgrel=2
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
b2sums=('4e54a3e118bb4e5b48c5330a01bb922216a8b2c70ad10a42442da92b9ec3468630044dcb730482dc572bdcf40b24a8c76b44e63f58eafeb38689d5cd7195676b'
        '7417ef3a58997ecc7cead377094b24a11d16ca47a1334378f26cdcd5421300ec26aa0afe987f2c44229546f73ae45d0dd1e4d1e06dfb720ca6d7a6b8edc4eec4')

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
