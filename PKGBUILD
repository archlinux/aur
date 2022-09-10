# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=grails
pkgname=(grails grails-docs)
pkgver=5.2.3
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
b2sums=('0fd4b0918206f03f4fd330eff3a4271e562128baa196bc82c94be66b9e4b78af78ed20f3bd3a7f878c3f2128d4b94eff25c596e641a7c4a9675bcd0528cadcc8'
        'a71bd8d67c4ee08cbb2db530340d667cf9f77229e377bd75de1c0c064de934e628b0db71fafb6cc37a3cbbbda25a89943f323618ace790868f8377a20c5c972c')

prepare() {
  cd $pkgbase-$pkgver
  echo 'export GRAILS_HOME=/usr/share/grails' > "${srcdir}/${pkgbase}.profile"
  setconf bin/grails APP_HOME /usr/share/grails
  tail bin/grails
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
  cd "$pkgdir/usr/share/$pkgname"
  rm -rf doc INSTALL LICENSE README
  find "${pkgdir}/usr/share" -name "*.bat" -exec rm {} \;
}

package_grails-docs() {
  pkgdesc='Documentation for Grails'
  install -d "$pkgdir/usr/share/doc" "$pkgdir/usr/share/grails"
  unzip "grails-docs-$pkgver.zip" -d "$pkgdir/usr/share/doc/grails-$pkgver"
  ln -s "/usr/share/doc/grails-$pkgver" "$pkgdir/usr/share/grails/doc"
}
