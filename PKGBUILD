# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_gemname="timeout"
pkgname="ruby-${_gemname}"
pkgver=0.4.1
pkgrel=3
pkgdesc="Auto-terminate potentially long-running operations in Ruby."
arch=("any")
url="https://github.com/ruby/timeout"
license=("Ruby" "BSD-2-Clause")
depends=("ruby")
checkdepends=("ruby-test-unit-ruby-core")
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('e645b34232af18857cbf121d35adf87039a157983dbcea500a3363639b8334e1')
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
