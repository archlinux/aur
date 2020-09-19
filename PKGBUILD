# Maintainer: Raimar Buehmann <raimar at buehmann dot de>

pkgname=eclipse-gef3
pkgver=3.10.1
_buildTime=201509250000
pkgrel=1
pkgdesc='Graphical Editing Framework for Eclipse IDE'
url='https://projects.eclipse.org/projects/tools.gef/'
arch=(any)
license=(EPL)
depends=(eclipse-common)
makedepends=(java-environment-common)
options=(!strip)
source=(
#	               https://www.eclipse.org/downloads/download.php?file=/tools/gef/downloads/drops/3.10.1/R201509250000/GEF-runtime-3.10.1.zip&mirror_id=1
	"download.zip::https://www.eclipse.org/downloads/download.php?file=/tools/gef/downloads/drops/${pkgver}/R${_buildTime}/GEF-runtime-${pkgver}.zip&mirror_id=1"
)
sha256sums=('ae1bcace58e153adf4022d3dd9de14c7bf62eef32d93458926741795e7ae3302')

package() {
  cd eclipse
  # remove not needed sources
  rm -Rf features/*.source_*
  #rm plugins/*.source_*.jar
  # remove not neede jar.pack.gz files
  #rm plugins/*.jar.pack.gz
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
