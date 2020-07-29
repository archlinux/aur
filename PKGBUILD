# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti@gmail.com>
# Contributor Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>
pkgname=eclipse-arm
pkgver=4.7.2
_date=202001271244
pkgrel=1
pkgdesc="GNU MCU Eclipse Plug-in"
arch=('any')
url="http://gnu-mcu-eclipse.github.io"
install="eclipse-arm.install"
license=("GPL")
options=('!strip')
makedepends=('unzip')
depends=('eclipse-cpp')
source=("https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases/download/v$pkgver-$_date/ilg.gnumcueclipse.repository-$pkgver-$_date.zip")
sha512sums=('0bb427417f93b7a79f9bb4dc838f705544d0d23d630b35fdb90423e32c1ee20f3b308a2e95e6fb0a881e0b82678cb68538be7df410540fbf45729c40efa107eb')

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
