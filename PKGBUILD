# Maintainer: Luís Ferreira <luis@aurorafoss.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=origami
pkgname=ruby-${_gemname}
pkgver=2.1.0
pkgrel=1
pkgdesc='Framework written in pure Ruby to manipulate PDF files'
url='https://github.com/gdelugre/origami'
arch=('any')
license=('LGPL')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/gdelugre/origami/archive/${pkgver}.tar.gz)
sha256sums=('92ce30bae084c07414cdfd4cf79ebc0435e04373ee954622f511ea757c84d0bb')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
  sed 's|README.md ||' -i ${_gemname}.gemspec
  sed -r 's|`git ls-files (.+)`|`find \1 -type f`|' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
