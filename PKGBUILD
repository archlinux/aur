#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-jubula
pkgver=4.0.0
_eclipseName=neon
pkgrel=1
pkgdesc='Jubula plugins for Eclipse IDE to create functional GUI tests'
arch=('any')
url='http://eclipse.org/jubula/'
license=('EPL')
depends=('eclipse>=4.3.0', 'eclipse-mylyn')
options=('!strip')
source=(
"https://hudson.eclipse.org/jubula/job/jubula-${_eclipseName}/lastSuccessfulBuild/artifact/org.eclipse.jubula.core/org.eclipse.jubula.repo/target/org.eclipse.jubula.repo-${pkgver}-SNAPSHOT.zip")
sha256sums=('67f7a5264b7ab3e469f3a7924e63eb27e21e1a8b867c8d4655826e5f91a4846a')

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
