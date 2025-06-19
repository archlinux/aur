# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=factory_bot
pkgname=ruby-$_gemname
pkgver=6.5.4
pkgrel=1
pkgdesc='A library for setting up Ruby objects as test data.'
arch=(any)
url="https://github.com/thoughtbot/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(ruby-rake)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('32f25c281f07a8cd0481af84bb8fabfe77cbc196f31fa1bb9cf6be4135ed47218ce4bdcab8d72a32390d01bb45a9e456f04195ca0f06b71aa9e7b77827cf9a72')

prepare() {
  cd "${_gemname}-${pkgver}"
  sed -r 's|~>|>=|g' -i "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
