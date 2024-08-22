# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_gemname="tracer"
pkgname="ruby-${_gemname}"
pkgver=0.2.3
pkgrel=1
pkgdesc="Outputs a source level execution trace of a Ruby program."
arch=("any")
url="https://github.com/ruby/$_gemname"
license=("Ruby" "BSD-2-Clause")
depends=("ruby")
checkdepends=("ruby-bundler" "ruby-irb" "ruby-rake" "ruby-test-unit")
#checkdepends=("ruby-test-unit-ruby-core")
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('28adc54d53ea8bb7b4a7624b9fcbc440ebd884626a891d67bd1d7afee3d7e660')
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

