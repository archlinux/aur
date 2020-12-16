# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti@gmail.com>
# Contributor Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>
pkgname=eclipse-arm
pkgver=5.2.1
_date=202010292017
pkgrel=1
pkgdesc="Eclipse Embedded CDT (C/C++ Development Tools)"
arch=('any')
url="https://projects.eclipse.org/projects/iot.embed-cdt"
install="eclipse-arm.install"
license=("GPL")
options=('!strip')
makedepends=('unzip')
depends=('eclipse-cpp')
source=("https://download.eclipse.org/embed-cdt/releases/$pkgver/ilg.gnumcueclipse.repository-$pkgver-$_date.zip")
sha512sums=('fc8491c4cc264686edf6d77cf833e197eb076a7c546d0b19f9890952d3c96a46f21b56836882faed5c18d079c25f0bc12a86910236e22a558ef44c9c37ca2d89')

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
