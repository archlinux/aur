# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-tmf-xtext
pkgver=2.19.0
_buildtime=R201909021322
pkgrel=2
pkgdesc="Textual Modeling Framework for Eclipse IDE"
arch=('any')
url="https://projects.eclipse.org/projects/modeling.tmf.xtext"
license=('EPL')
depends=('eclipse-m2t-xpand')
options=('!strip')
# http://download.eclipse.org/modeling/tmf/xtext/downloads/drops/
source=(
	https://download.eclipse.org/modeling/tmf/xtext/downloads/drops/${pkgver}/${_buildtime}/tmf-xtext-Update-${pkgver}.zip
)
# do not extract all package sources
sha256sums=('2840a0312f62934f08ffb7d4e6d3459b3bdd7295e17c9cc35eefcbf81e488938')
package() {
  # remove features and plug-ins containing sources
  # rm features/*.source_*
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
