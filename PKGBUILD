#Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-jubula
pkgver=2.3.0
pkgrel=1
pkgdesc='A Functional Testing Feature for Eclipse'
arch=('any')
url='http://eclipse.org/jubula/'
license=('EPL')
depends=('eclipse>=4.3.0', 'eclipse-mylyn')
options=('!strip')
source=("https://hudson.eclipse.org/hudson/job/jubula-luna/lastSuccessfulBuild/artifact/jubula/org.eclipse.jubula.site/target/org.eclipse.jubula.site-2.3.0-SNAPSHOT.zip")
sha256sums=('b60d416e4727f73ee5cb06ef19b5647d09957faf0b12ebfe73459a3c20eac61a')

package() {
  # remove features and plug-ins contain sources
  rm features/*.source_*
  rm plugins/*.source_*
  # remove gz files
  rm plugins/*.pack.gz
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
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
