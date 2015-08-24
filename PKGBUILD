# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Emanuel Couto <unit73e@gmail.com>
# Contributor: xgdgsc <xgdgsc@gmail.com>
# Contributor: Jesús Jerez <jerezmoreno@gmail.com>
pkgname=eclipse-eclipsecolortheme
pkgver=1.0.0
pkgrel=4
pkgdesc="Eclipse Color Theme"
url="http://www.eclipsecolorthemes.org"
license=("EPL/1.0")
arch=('any')
depends=('eclipse')
makedepends=("unzip" "java-environment")
noextract=("${pkgname}.zip")
source=("${pkgname}.zip::http://eclipse-color-theme.github.io/update/eclipse-color-theme-update-site.zip")
noextract=("${pkgname}.zip")
md5sums=('c0df9d934ec90c983382e266514601c9')

_extract() {
  [[ -d plugins ]] && return
  ( unzip "${pkgname}.zip" > /dev/null || return 0 )
  mv update/* .
  rm -r update
}

prepare() {
  _extract
}

pkgver() {
  _extract
  echo plugins/com.github.eclipsecolortheme_*.jar | grep -Po '(?<=com.github.eclipsecolortheme_)\d+\.\d+\.\d+(?=\.\d{12}\.jar)'
}

package() {
  _dest="${pkgdir}"/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}"/${_feature%*.jar}
      cd "${_dest}"/${_feature/.jar}
      jar xf "${srcdir}/${_feature}" || return 1
    else
      install -Dm644 ${_feature} "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} "${_dest}/${_plugin}"
  done
}
