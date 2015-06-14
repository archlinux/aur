# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Robson R S Peixoto <robsonpeixoto@gmail.com>
# Contributor: Piotr Beling <qwak@w8.pl>

# added package(), adopted some conventions from 
# https://wiki.archlinux.org/index.php/Eclipse_plugin_package_guidelines
#        -- dsboger

pkgname=texlipse
pkgver=1.5.0
pkgrel=4
pkgdesc="A plugin that adds LaTeX support to the Eclipse IDE"
url="http://texlipse.sourceforge.net/"
depends=('eclipse>=3.3' 'texlive-core')
arch=('any')
source=("http://downloads.sourceforge.net/texlipse/texlipse_${pkgver}%20src.zip")
license=('EPL')
md5sums=('db3de591e25d0ee3fbd03ce7d119fd15')

prepare() {
  # remove features and plug-ins containing sources
  rm -rf features/*.source_*
  rm -rf plugins/*.source_*
  # remove gz files
  rm -rf plugins/*.pack.gz
}

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/eclipse 
  # somehow eclipse does not recognize this plugin if put under dropins/texlipse/eclipse

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

