#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-jboss
pkgver=4.15.0.Final
_eclipsever=photon
pkgrel=1
pkgdesc='JBoss application server developer tools plugins for Eclipse IDE'
arch=('any')
url='http://tools.jboss.org/'
license=('LGPL' 'EPL' 'BSD')
depends=('eclipse>=4.5.0')
options=('!strip')
source=("download.zip::http://download.jboss.org/jbosstools/static/${_eclipsever}/stable/updates/core/jbosstools-${pkgver}-updatesite-core.zip")
sha256sums=('a597d2b096d974448873d53a7fdd0c99070d8a3d7e00ac493f2401fa64471001')
          
package() {
  # remove features and plug-ins containing sources
  rm features/*.source_*
  rm plugins/*.source_*
  # remove gz files
  rm plugins/*.pack.gz
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  # extract features (otherwise features are not recognized)
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done
  # copy plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
