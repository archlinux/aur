# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=3.1.1
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
sha512sums=('cb2f46af30842b4edcdf3b604afc0c90bfea0462381fbe6e106434956effc4eaa93963cc7e10bb624712c8ae3968ecd723223d3ebbb7826bd7e72fde6076eade'
            'e72f686c54ee58d222e7e89660c92531e75e89cd2ca6d29ca450e78ef7d9f5c0fb8ffcb1aa441128c681dfdc786272f755aea7efb9fc7df15f93a0370a49fdad')

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
  cp media/icons/*.png "${pkgdir}/usr/share/pixmaps/"
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
