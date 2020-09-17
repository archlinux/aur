# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-tpd
pkgver=3.0.0
_buildtime=202005061025
pkgrel=2
pkgdesc="Target Platform DSL plug-in for Eclipse IDE"
arch=('any')
url="https://github.com/eclipse-cbi/targetplatform-dsl"
license=('EPL1.0')
depends=('eclipse-tmf-xtext')
options=('!strip')
# https://download.eclipse.org/cbi/tpd/3.0.0-SNAPSHOT/
source=(
	https://download.eclipse.org/cbi/tpd/${pkgver}-SNAPSHOT/org.eclipse.cbi.targetplatform-${pkgver}.${_buildtime}.zip
#	"https://mbarbero.github.io/fr.obeo.releng.targetplatform/p2/${pkgver/\.1}/$pkgver.$_buildtime/plugins/fr.obeo.releng.targetplatform_$pkgver.$_buildtime.jar"
#	"https://mbarbero.github.io/fr.obeo.releng.targetplatform/p2/${pkgver/\.1}/$pkgver.$_buildtime/plugins/fr.obeo.releng.targetplatform.ui_$pkgver.$_buildtime.jar"
)
# do not extract all package sources
#noextract=("${source[@]##*/}")
sha256sums=('ff080de2c76706fd40d6977e6fd120181421da3d4214e8fd45fd08fbbd11bc31')
package() {
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
