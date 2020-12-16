# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti@gmail.com>
# Contributor Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>
pkgname=eclipse-arm
pkgver=5.1.2
_date=202009201439
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
sha512sums=('953f19807f98465243f4e373d51c38aa1642c80de968b5f9ccf6f19fd15a9150821afcfca34e2fd2c9590240b2a2e080838cc3cf31b6faf951a77786c84e1cd3')

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
