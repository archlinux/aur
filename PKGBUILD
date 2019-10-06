# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-tpd
pkgver=3.0.0
_buildtime=201902111444
pkgrel=1
pkgdesc="Target Platform DSL plug-in for Eclipse IDE"
arch=('any')
url="https://github.com/mbarbero/fr.obeo.releng.targetplatform"
license=('EPL1.0')
depends=(eclipse-tmf-xtext eclipse-m2t-xpand)
options=('!strip')
# https://download.eclipse.org/cbi/tpd/3.0.0-SNAPSHOT/
source=(
	https://download.eclipse.org/cbi/tpd/${pkgver}-SNAPSHOT/org.eclipse.cbi.targetplatform-${pkgver}.${_buildtime}.zip
#	"https://mbarbero.github.io/fr.obeo.releng.targetplatform/p2/${pkgver/\.1}/$pkgver.$_buildtime/plugins/fr.obeo.releng.targetplatform_$pkgver.$_buildtime.jar"
#	"https://mbarbero.github.io/fr.obeo.releng.targetplatform/p2/${pkgver/\.1}/$pkgver.$_buildtime/plugins/fr.obeo.releng.targetplatform.ui_$pkgver.$_buildtime.jar"
)
# do not extract all package sources
#noextract=("${source[@]##*/}")
sha256sums=('3e754e44fd0c1b4d2b68e3d3bdd41c040fc14c9639946dc911d4ec8e17c6ab79')
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
