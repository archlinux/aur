# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_gemname=public_suffix
pkgname=ruby-public_suffix-3
pkgver=3.1.1
pkgrel=1
pkgdesc='Domain name parser based on the Public Suffix List (3.x-branch)'
arch=('any')
url='https://simonecarletti.com/code/publicsuffix-ruby'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/weppos/publicsuffix-ruby/archive/v${pkgver}.tar.gz)
sha512sums=('70bc8cd7804f75543043790754b9065a1c1b8cbc8c933ffad7d19d930289ce02643fbe3f006ad5266e018dfd5fe0dc69e0ab5fae039971d2614ba186633935fe')

prepare() {
  cd publicsuffix-ruby-${pkgver}
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec # don't give a fuck about rubys bla bla
  sed 's|git ls-files -- {test,spec,features}/*|find -type f test spec features|' -i ${_gemname}.gemspec
  sed 's|git ls-files|find -type f|' -i ${_gemname}.gemspec
}

build() {
  cd publicsuffix-ruby-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd publicsuffix-ruby-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
