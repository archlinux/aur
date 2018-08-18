#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-jubula
pkgver=6.0.0
_eclipseName=photon
_buildNumber=3
pkgrel=1
pkgdesc='Jubula plugins for Eclipse IDE to create functional GUI tests'
arch=('any')
url='http://eclipse.org/jubula/'
license=('EPL')
depends=('eclipse>=4.6.0', 'eclipse-common')
makedepends=('java-environment-common')
options=('!strip')
source=(
"https://hudson.eclipse.org/jubula/job/jubula-${_eclipseName}/${_buildNumber}/artifact/org.eclipse.jubula.core/org.eclipse.jubula.repo/target/org.eclipse.jubula.repo-${pkgver}-SNAPSHOT.zip")
sha256sums=('2c657061966153d012f5b0ff253caf7d4c56e97792078396d5fb2053f749f0b2')

package() {
  # remove features and plug-ins contain sources
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
