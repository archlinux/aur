# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Piotr Beling <qwak@w8.pl>

pkgname=eclipse-texlipse
pkgver=2.0.4
pkgrel=1
pkgdesc="LaTeX support plugin for Eclipse IDE"
url="https://projects.eclipse.org/projects/science.texlipse"
depends=('eclipse>=4.5.0' 'texlive-core')
conflicts=('texlipse')
provides=('texlipse')
arch=('any')
license=('EPL')
source=("https://ftp.halifax.rwth-aachen.de/eclipse/texlipse/updates/release/2.0.4/TeXlipse-Updates-2.0.4.zip")
sha256sums=('d624b13d8e2674107f4fc960d8e1f04eca3e6446ee2f387a9155604fe270237e')

prepare() {
  # remove features and plug-ins containing sources
  rm -rf features/*.source_*
  rm -rf plugins/*.source_*
  # remove gz files
  rm -rf plugins/*.pack.gz
}

package() {
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse 

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      # extract features (otherwise they are not visible in about dialog)
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
  done
}
