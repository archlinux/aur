# Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-m2t-xpand
pkgver=2.2.0
_buildtime=R201605260315
pkgrel=3
pkgdesc='Model to Text Xpand for Eclipse IDE'
url="https://projects.eclipse.org/projects/modeling.m2t.xpand"
arch=('any')
license=('EPL')
depends=('eclipse-emft-mwe')
makedepends=('java-environment-common')
options=(!strip)
# https://download.eclipse.org//modeling/m2t/xpand/downloads/drops/2.2.0/R201605260315/m2t-xpand-Update-2.2.0.zip
source=(
	https://download.eclipse.org//modeling/m2t/xpand/downloads/drops/${pkgver}/${_buildtime}/m2t-xpand-Update-${pkgver}.zip
)
sha256sums=('90a217c3231dbcab6773cb0470557c7ae760d73b15a3c430895cdebf79bacf08')

package() {
  # remove features and plug-ins containing sources
#  rm features/*.source_*
  rm plugins/*.source_*
  # remove gz files
  rm plugins/*.pack.gz
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  # remove feature sources
  rm features/*source_*
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
