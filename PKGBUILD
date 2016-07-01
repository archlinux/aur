# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=3.1.9
pkgrel=1
pkgdesc='Groovy on rails, web framework'
url='http://grails.org/'
arch=('any')
license=('Apache')
makedepends=('apache-ant' 'unzip' 'setconf' 'junit' 'java-environment')
optdepends=('groovy: the groovy programming language'
            'grails-docs: documentation for grails')
options=('!emptydirs')
noextract=("${pkgname[1]}-${pkgver}.zip")
source=(${pkgname[0]}-${pkgver}.zip::https://github.com/grails/grails-core/releases/download/v${pkgver}/grails-${pkgver}.zip
        ${pkgname[1]}-${pkgver}.zip::https://github.com/grails/grails-doc/releases/download/v${pkgver}/grails-docs-${pkgver}.zip)
sha512sums=('cc9a718327bc07fabc5ccf502ab182d2b75d002751896c03e2141f5ad56f158df8aceb417a104f4b0324834f8274677034b3f281a288c7f1b2490fa1bce84f14'
            '516d70b6ead5433accdbeba5cffe241bea4d02e3b9f6685a90c348dcbc3931a0a0d2c7872722150121deb41e45d6d200cf5c79a5452f58d5a74844dc764cf7be')

prepare() {
  cd ${pkgbase}-${pkgver}
  echo 'export GRAILS_HOME=/usr/share/grails' > "${srcdir}/${pkgbase}.profile"
  setconf bin/grails APP_HOME /usr/share/grails
}

package_grails() {
  depends=('java-environment' 'junit' 'bash')

  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/share/pixmaps"
  cp -r . "${pkgdir}/usr/share/${pkgname}"
  install -Dm 755 bin/grails "${pkgdir}/usr/bin/grails"
  cp media/icons/*.png "${pkgdir}/usr/share/pixmaps"
  install -Dm 755 "${srcdir}/${pkgbase}.profile" "${pkgdir}/etc/profile.d/${pkgname}.sh"

  # clean up
  cd "${pkgdir}/usr/share/${pkgname}"
  rm -rf doc INSTALL LICENSE README
  find "${pkgdir}/usr/share" -name "*.bat" -exec rm {} \;
}

package_grails-docs() {
  pkgdesc='Documentation for Grails'
  install -d "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/grails"
  unzip "grails-docs-${pkgver}.zip" -d "${pkgdir}/usr/share/doc/grails-${pkgver}"
  ln -s "/usr/share/doc/grails-${pkgver}" "${pkgdir}/usr/share/grails/doc"
}

# vim: ts=2 sw=2 et:
