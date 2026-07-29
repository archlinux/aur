# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

_gemname=oci
pkgname=ruby-${_gemname}
pkgver=2.24.0
pkgrel=1
pkgdesc='Ruby SDK for Oracle Cloud Infrastructure'
arch=('any')
options=('!strip')
url='https://github.com/oracle/oci-ruby-sdk'
license=('Apache-2.0 OR UPL-1.0')
depends=('ruby' 'ruby-circuitbox' 'ruby-event_stream_parser' 'ruby-inifile' 'ruby-jwt')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3823dd87ca5655de65b23b456fcdf986d29b1f740fbd09fb02d6d2c4cb1bafcc')

prepare() {
  cd "${_gemname}-ruby-sdk-${pkgver}"

  sed -i -E "/add_runtime_dependency/ { s/, ['\"](~>|>=|<=|=|<|>) [0-9]+(\.[0-9]+)*['\"]//g; s/, ['\"](~>|>=|<=|=|<|>) [0-9]+(\.[0-9]+)*['\"]//g }" oci.gemspec
}

build() {
  cd "${_gemname}-ruby-sdk-${pkgver}"

  gem build ${_gemname}.gemspec
}

package() {
  cd "${_gemname}-ruby-sdk-${pkgver}"

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -N --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
