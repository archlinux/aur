# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=grails
pkgname=(grails grails-docs)
pkgver=5.0.2
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
b2sums=('3f99158bda95dee90ab8433aff6cea4de3579b125b2c1ee0848dacb5b804573173dcd1bdfc02ec4407a842079e26adf5c54a1e3dbafa70de8cd5bb4b6b42b77b'
        '1657c1a0d147dd01651643d8501dcf04ab32ace29b30b9cac23c1e6ce29b24cde8bed287d1724ab11be3372afb61be97ebdf1dcc1c68840524e634cf784258e4')

prepare() {
  cd $pkgbase-$pkgver
  echo 'export GRAILS_HOME=/usr/share/grails' > "${srcdir}/${pkgbase}.profile"
  env
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
