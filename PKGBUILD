# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: Alistair Dutton <kelveden at gmail.com>

pkgname=eclipse-checkstyle
pkgver=7.2.0
_buildtime=201611082205
pkgrel=1
pkgdesc="Checkstyle plugin for Eclipse IDE"
arch=('any')
url="http://eclipse-cs.sourceforge.net/"
license=('LGPL2.1')
depends=('eclipse>=4.5.0')
options=('!strip')
# http://sourceforge.net/projects/eclipse-cs/files/latest/download?source=files
source=("download.zip::http://downloads.sourceforge.net/project/eclipse-cs/Eclipse%20Checkstyle%20Plug-in/${pkgver}/net.sf.eclipsecs-updatesite_${pkgver}.${_buildtime}.zip")
sha256sums=('223d9dc36bc7bb6cbef322d21eb5e1c1d1ff0872620249ceda0566c3e8c0f613')

package() {
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  cd ${srcdir}

  # remove features and plug-ins containing sources
  rm features/*.source_*
  rm plugins/*.source_*

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

