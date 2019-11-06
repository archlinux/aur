# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti@gmail.com>
# Contributor Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>
pkgname=eclipse-arm
pkgver=4.7.1
date=201911052135
pkgrel=1
pkgdesc="GNU MCU Eclipse Plug-in"
arch=('any')
url="http://gnu-mcu-eclipse.github.io"
install="eclipse-arm.install"
license=("GPL")
options=('!strip')
depends=('eclipse-cpp')
source=("https://github.com/gnu-mcu-eclipse/eclipse-plugins/releases/download/v$pkgver-$date/ilg.gnumcueclipse.repository-$pkgver-$date.zip")
sha512sums=('f172e746d3323c31fbb2b95fb369aff4fc2083462febf8489a7b848091d62e80e527e0b0881802528cfbbc248f06c80dcf65642ce6212c888a53cde4b9ed7716')

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"

  # Features
  find features -type f | while read -r _feature ; do
    if [[ "${_feature}" =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}/${_feature%*.jar}"
      cd "${_dest}/${_feature/.jar}"
      # extract features (otherwise they are not visible in about dialog)
      jar xf "${srcdir}/${_feature}" || return 1
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
      jar xf "${srcdir}/${_plugin}" || return 1
    else
      install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
    fi
  done
}
