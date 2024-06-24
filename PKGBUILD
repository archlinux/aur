# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_gemname="resolv"
pkgname="ruby-${_gemname}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Thread-aware DNS resolver library in Ruby."
arch=("any")
url="https://github.com/ruby/$_gemname"
license=("Ruby" "BSD-2-Clause")
depends=("ruby")
checkdepends=("ruby-test-unit-ruby-core")
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('20fa8d7c5b78ba843c56341dde420f6b321ed8c38a0895588a2d29da31bc7c0e')
prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}-${pkgver}
  rake test
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}
