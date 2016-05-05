# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=3.1.6
pkgrel=1
pkgdesc='Groovy on rails, web framework'
url='http://grails.org/'
arch=('any')
license=('Apache')
makedepends=('apache-ant' 'unzip' 'setconf' 'junit' 'java-environment')
optdepends=(
  'groovy: the groovy programming language'
  'grails-docs: documentation for grails'
)
options=('!emptydirs')
noextract=("${pkgname[1]}-${pkgver}.zip")
source=(${pkgname[0]}-${pkgver}.zip::https://github.com/grails/grails-core/releases/download/v${pkgver}/grails-${pkgver}.zip
        ${pkgname[1]}-${pkgver}.zip::https://github.com/grails/grails-doc/releases/download/v${pkgver}/grails-docs-${pkgver}.zip)
sha512sums=('00878e7b09a9b85c1b567f1c7bf339f8c31609c1510902ceb0f944251936dd6767f9f20a7d7c9a3fff46afd35f058940d914477ea0d447770f4c1a5ffc250cb9'
            'e903888214ef92ed3c05657f91bca27ca11a8c51bf43b46c83a0c330857bb29ad93e10d3df0df24b74e8c6b0d263f065e89b950224c2063d3f05cb2a8b431baf')

prepare() {
  cd ${pkgbase}-${pkgver}
  # profile.d script
  echo 'export GRAILS_HOME=/usr/share/grails' > "${srcdir}/${pkgbase}.profile"
  # set APP_HOME
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
