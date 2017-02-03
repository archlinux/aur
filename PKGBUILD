# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=3.2.5
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
sha512sums=('3b59d473cf1a76e95d8d51fa1b887ef980d14231cc37d5849ce548cd94c1710c80110214a61b70a7f30bf388972278460d29ab5b78837c220c30bd0a6c6ba23f'
            'a92d2c74e712c01f9fff3cd10954dc7c84cdd3bcec134d90a45b18d4407ed5823fa4fd58a550a40b1cdf4ee6f9b9699dcdf4aec403efb0de6dc5b27b8aa2c478')

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
  install -Dm 644 media/icons/*.png -t "${pkgdir}/usr/share/pixmaps"
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
