# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=factory_bot
pkgname=ruby-$_gemname
pkgver=6.2.1
pkgrel=1
pkgdesc='Provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures'
arch=(any)
url="https://github.com/thoughtbot/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(ruby-rake)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f09e89f39ede095c230ed82123c269df4caa057315d56e08c131a4366dfc075f547627dbbd8c36520fcf825c8bc103e358390e2a9fe3d8c67059b229c706ce6c')

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
