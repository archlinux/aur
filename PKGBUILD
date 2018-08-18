# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>
# Contributor: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Piotr Beling <qwak@w8.pl>

pkgname=eclipse-texlipse
pkgver=2.0.2
pkgrel=1
_build=5
pkgdesc="LaTeX support plugin for Eclipse IDE"
url="http://projects.eclipse.org/projects/science.texlipse"
depends=('eclipse>=4.5.0' 'texlive-core')
conflicts=('texlipse')
provides=('texlipse')
arch=('any')
license=('EPL')
source=("https://ci.eclipse.org/texlipse/job/release/$_build/org.eclipse.texlipse%24org.eclipse.texlipse-site/artifact/org.eclipse.texlipse/org.eclipse.texlipse-site/${pkgver}-SNAPSHOT/org.eclipse.texlipse-site-${pkgver}-SNAPSHOT.zip")
sha256sums=('f85b38a8c454f48d2b822aa526f7fd15c9db32a92465b4647e9fd7c6bcb7fba5')

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
