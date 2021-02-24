# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=factory_bot
pkgname=ruby-$_gemname
pkgver=6.1.0
pkgrel=1
pkgdesc='Provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures.'
arch=(any)
url="https://github.com/thoughtbot/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(ruby-rake)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('bbb0e6316bdc44a483afba3a8a2e49732900fc5ac93222329514abcebab898f01a2258c77fd16466afcb7ffb5f454bf2b594bd5724aed703e30051cbeea1d243')

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
