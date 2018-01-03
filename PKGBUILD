# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=safe_yaml
pkgname=ruby-safe_yaml
pkgver=1.0.4
pkgrel=3
pkgdesc='Parse YAML safely'
url='https://github.com/dtao/safe_yaml'
arch=('any')
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/dtao/safe_yaml/archive/${pkgver}.tar.gz)
sha256sums=('fb6939f6780680716a7c1eeb4ddf843d03a5951539fcdccce5901c3eb0a525c9')
sha512sums=('88f498443e556117090cae219a5c1c853b4ab3fb1248e3f7e9d7d3df7d016a894add50b7d713d44e62a86bdce3c98190b6930a22bba85b32d5519dafec5cdb1f')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec # don't give a fuck about rubys bla blaA
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
