# Maintainer: Raimar Buehmann <raimar at buehmann dot de>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jerezmoreno@gmail.com>

pkgname=eclipse-pde
pkgver=4.13
_buildTime=201909161045
pkgrel=1
pkgdesc='Plug-in Development Environment Binary for Eclipse IDE'
url="http://www.eclipse.org/pde/"
arch=('any')
license=('EPL')
depends=('eclipse-rcp-source')
makedepends=('java-environment-common')
options=(!strip)
# https://download.eclipse.org/eclipse/downloads/
# https://download.eclipse.org/eclipse/downloads/drops4/R-4.13-201909161045/
source=(
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/eclipse/downloads/drops4/R-${pkgver}-${_buildTime}/org.eclipse.pde-${pkgver}.zip"
)
sha256sums=('99f88e26c9dcf4a1aee30fb8f7b124ad811d2dcbd91a3fa4040a20cca1e80c83')

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
