#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-moreunit
pkgver=3.0.5
pkgrel=4
pkgdesc='JUnit assistent to write more tests in Eclipse'
arch=('any')
url='http://moreunit.sourceforge.net/'
license=('EPL')
depends=('eclipse>=4.5.0')
options=('!strip')
source=("download.zip::http://sourceforge.net/projects/moreunit/files/moreunit/Version%20${pkgver}/org.moreunit-${pkgver}.zip")
sha256sums=('e499a621991ba41159d0084d549d57108d80660c88a3b8b0d68a552fc139dbed')

package() {
  # sub folder of the zip file containing the features and plugins folder
  _subfolder=$srcdir/org.${pkgname/eclipse-}-$pkgver
  cd $_subfolder
  # remove plug-ins containing sources
  rm plugins/*.source_*
  _dest=$pkgdir/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  # extract features (otherwise features are not recognized)
  find features -type f | while read _feature ; do
    if [[ $_feature =~ (.*\.jar$) ]] ; then
      install -dm755 $_dest/${_feature%*.jar}
      cd $_dest/${_feature/.jar}
      jar xf $_subfolder/$_feature || return 1
    else
      install -Dm644 $_subfolder/$_feature $_dest/$_feature
    fi
  done
  # copy plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 $_plugin $_dest/$_plugin
  done
}
