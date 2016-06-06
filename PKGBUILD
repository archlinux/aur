# Maintainer: Zuyi Hu <hzy068808@gmail.com>
# Contributor: Raimar Bühmann <raimar@buehmann.de>
# Contributor: Benjamin Robinben <jarobin@gmail.com>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>
pkgname=eclipse-arm
pkgver=2.12.1
date=201604190915
pkgrel=1
pkgdesc="GNU ARM Eclipse Plug-in"
arch=('any')
url="http://gnuarmeclipse.github.io"
install="eclipse-arm.install"
license=("GPL")
options=('!strip')
depends=('eclipse-cpp')
source=(#"http://sourceforge.net/projects/gnuarmeclipse/files/Current%20Releases/2.x/ilg.gnuarmeclipse.repository-$pkgver-$date.zip"
        "https://github.com/gnuarmeclipse/plug-ins/releases/download/v$pkgver-$date/ilg.gnuarmeclipse.repository-$pkgver-$date.zip")
sha512sums=('0fa64c79e81ce8a9d23c6ecbdaf6cf50a205a5d69a7a4cd5ad08eeafdcdf71ec2888cb98a5a6453713b3c65333bc2f2ee4893f207b80772a06f5aca567c95126')

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
