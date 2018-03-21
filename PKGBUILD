# Maintainer: Raimar Buehmann <raimar at buehmann dot de>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jerezmoreno@gmail.com>

pkgname=eclipse-pde
pkgver=4.7.3
_buildTime=201803010715
pkgrel=1
pkgdesc='Plug-in Development Environment Binary for Eclipse IDE'
url="http://www.eclipse.org/pde/"
arch=('any')
license=('EPL')
depends=('eclipse-rcp-source')
makedepends=('java-environment-common')
options=(!strip)
source=(
	"http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/eclipse/downloads/drops4/R-${pkgver}-${_buildTime}/org.eclipse.pde-${pkgver}.zip"
)
sha256sums=('418f596a27a8346f807467a2b46707fc4fc5c8c241791956b4b7f60e0e671770')

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
