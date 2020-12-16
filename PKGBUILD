# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti@gmail.com>
# Contributor Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>
pkgname=eclipse-arm
pkgver=6.0.0
_date=202012080907
pkgrel=1
pkgdesc="Eclipse Embedded CDT (C/C++ Development Tools)"
arch=('any')
url="https://projects.eclipse.org/projects/iot.embed-cdt"
install="eclipse-arm.install"
license=("GPL")
options=('!strip')
makedepends=('unzip')
depends=('eclipse-cpp>=2:4.17')
source=("https://www.eclipse.org/downloads/download.php?file=/embed-cdt/releases/$pkgver/org.eclipse.embedcdt.repository-$pkgver-$_date.zip&r=1")
sha512sums=('3c7a017927f7c848f4015cc8d30e38b38401d665e0a5dc8d9648d961f00f0085193adf0a9d8579692458975e415fdfb2d0d447afb47e369cfd2593665a299fab')

package() {
  local _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"
  local _feature
  local _plugin

  # Features
  find features -type f | while read -r _feature ; do
    if [[ "${_feature}" =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}/${_feature%*.jar}"
      cd "${_dest}/${_feature/.jar}"
      # extract features (otherwise they are not visible in about dialog)
      unzip "${srcdir}/${_feature}" || return 1
    else
      install -Dm644 "${_feature}" "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read -r _plugin ; do
  if [[ "${_plugin}" =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}/${_plugin%*.jar}"
      cd "${_dest}/${_plugin/.jar}"
      # extract plugins (otherwise their content in not accessible from within eclipse)
      unzip "${srcdir}/${_plugin}" || return 1
    else
      install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
    fi
  done
}
