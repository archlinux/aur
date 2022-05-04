# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=grails
pkgname=(grails grails-docs)
pkgver=5.1.2
pkgrel=1
pkgdesc='Groovy on rails, web framework'
url='https://grails.org/'
arch=(any)
license=(Apache)
makedepends=(apache-ant java-environment junit setconf unzip)
optdepends=('grails-docs: documentation for grails'
            'groovy: the groovy programming language')
options=('!emptydirs')
noextract=("${pkgname[1]}-${pkgver}.zip")
source=(${pkgname[0]}-${pkgver}.zip::https://github.com/grails/grails-core/releases/download/v${pkgver}/grails-${pkgver}.zip
        ${pkgname[1]}-${pkgver}.zip::https://github.com/grails/grails-doc/releases/download/v${pkgver}/grails-docs.zip)
b2sums=('60befa361c8df05c7cf6dcf85343856fb422b806ec60fabad65643d0393213d934e276f2a1e51fa9ef1298fb49d2cdf43013991440f294b8dfc167589b1a5014'
        'b4a71f5d9ab5627903552370df0787d210db1203ea91e20d3abd394ed8e34d508ec56c761dd87f198c021b0fa1a71d7061a7965a6eb9b173de5b9dd10ac0a8fc')

prepare() {
  cd $pkgbase-$pkgver
  echo 'export GRAILS_HOME=/usr/share/grails' > "${srcdir}/${pkgbase}.profile"
  setconf bin/grails APP_HOME /usr/share/grails
  tail bin/grails
}

package_grails() {
  depends=('java-environment' 'junit' 'bash')

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
