# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-swtbot
pkgver=2.8.0
pkgrel=2
pkgdesc='SWT UI Testing for Eclipse IDE'
arch=('any')
url='https://projects.eclipse.org/projects/technology.swtbot'
license=('EPL')
depends=('eclipse')
options=('!strip')
# http://download.eclipse.org/technology/swtbot/releases/2.8.0/repository.zip
source=(
	http://download.eclipse.org/technology/swtbot/releases/${pkgver}/repository.zip
)
sha256sums=('e3db769d911ae730c825841b7d643e23436bea79e7a52af74e4ae5bcfa7d9116')

package() {
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  cd ${srcdir}
  # remove gz files
  rm plugins/*.pack.gz
  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
