# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=safe_yaml
pkgname=ruby-safe_yaml
pkgver=1.0.5
pkgrel=3
pkgdesc='Parse YAML safely'
url='https://github.com/dtao/safe_yaml'
arch=('any')
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc' 'ruby-rake' 'ruby-rspec')
options=('!emptydirs')
source=(https://github.com/dtao/safe_yaml/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5ca8472b09e5a463414417355d646e69f4754cb15db21771b45ad7173692dac9ebdfe96ee18659e018fa9b835ce42762c3c61889e127f4f44d658f9d279a1283')
b2sums=('f7d58ff81758ccbae960b887005f0fd9e48370b91d104959b877b8e5bd1d54779853e515e69dc152cdc0810f69e92915f11f1bb96a32cb387ce77c80c1f3e6d0')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}-${pkgver}
  # TODO: enable once needed dependency has a new release
  #rake spec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -r "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
