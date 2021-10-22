pkgname=eclipse-ft9xx
pkgver=2.5.0
pkgrel=1
pkgdesc="Bridgetek FT9xx Eclipse Plugins"
arch=('any')
url="https://brtchip.com/ft9xx-toolchain/"
license=('EPL')
depends=('eclipse' 'p7zip')
optdepends=('bugzilla: ticketing support')
source=("https://github.com/perigoso/eclipse-ft9xx/archive/refs/tags/V${pkgver}.tar.gz")
_src="${pkgname}-${pkgver}/com.ftdichip.ft90x"
sha512sums=('6e12361d398d48850c1c07a7ead4c6e3a7ee2e3dbf8e7a5f0cca32cc4e4949edeac718ff8c5ce7d013d33676b520ef3dbc3729e3a1c1661ec085c6a4085ee6a4')

prepare() {
  cd ${_src}

  # remove features and plug-ins containing sources
  rm -f features/*.source_*
  rm -f plugins/*.source_*
  # remove gz files
  rm -f plugins/*.pack.gz
}

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse"

  cd ${_src}

  # Features
  find features -type f | while read -r _feature ; do
    if [[ "${_feature}" =~ (.*\.jar$) ]] ; then
      install -dm755 "${_dest}/${_feature%*.jar}"
      cd "${_dest}/${_feature/.jar}"
      # extract features (otherwise they are not visible in about dialog)
      jar xf "${srcdir}/${_src}/${_feature}" || return 1
    else
      install -Dm644 "${_feature}" "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read -r _plugin ; do
    install -Dm644 "${_plugin}" "${_dest}/${_plugin}"
  done
}
