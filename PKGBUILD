# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgbase=grails
pkgname=('grails' 'grails-docs')
pkgver=3.1.3
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
sha512sums=('4b3f96863e8af34e088e2aa99877fa55188d6a361e325c0f88cf5b0b304289bb8d055969de48efd399c553fca85585b55019f67789c7d7aa57a05439d10ae5b7'
            'd3397efa00f40158ecb58be04e3c3671f8448caa5433c9c2648754eba63bd4f158884941fc15236ad12b8fdbf6efdbb5b414cc63acc16464a3f17ba409704a1e')

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
