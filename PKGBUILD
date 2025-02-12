# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=factory_bot
pkgname=ruby-$_gemname
pkgver=6.5.1
pkgrel=1
pkgdesc='Provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures'
arch=(any)
url="https://github.com/thoughtbot/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(ruby-rake)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4ee819d7ede1b248951fe11bb6f033f73f72da689e5c8dbda50b7fa26bfde5b0ab0bb8b6a2b06f2f6548ce8bd6b4a565946073d98c93c9d552cd91e6fe6dcc5b')

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
