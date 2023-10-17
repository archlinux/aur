# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

_gemname=liquid
pkgname=ruby-$_gemname
pkgver=5.4.0
pkgrel=1
pkgdesc='Liquid markup language. Safe, customer facing template language for flexible web apps'
url='https://shopify.github.io/liquid/'
arch=('any')
license=('MIT')
makedepends=('ruby-rdoc')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Shopify/${_gemname}/archive/v${pkgver}.tar.gz)
sha512sums=('45b394aa945206b200a2aa30e2e0b0f0937e7e59bd213f45f0484f2f6f3d68fca96f93a7ae64ac05249439048842b53e20a58d73be88470ed94cf40cc65c4cfb')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec # don't give a fuck about rubys bla bla
  sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
