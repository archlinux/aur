# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jelle van der Waa <jelle@archlinux.org>

_gemname='sinatra'
pkgname="ruby-${_gemname}-1"
pkgver=1.4.8
pkgrel=1
pkgdesc='Classy web-development dressed in a DSL (1.x version)'
arch=('any')
url="https://rubygems.org/gems/${_gemname}/versions/${pkgver}"
_repourl="https://github.com/${_gemname}/${_gemname}"
license=('MIT')
depends=(
  'ruby'
  'ruby-rack>=1.5'
  'ruby-rack-protection>=1.4'
  'ruby-tilt>=1.3'        'ruby-tilt<3'
)
provides=("${pkgname%-*}=${pkgver}")
options=('!emptydirs')
_tarname="${_gemname}-${pkgver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('961aa7b4c92b116e4ed23f6a7500437224906d0089e757aeddf49c87dc2a0637b22988ffa953bcec49a35aad268ed0a988f2299bc9e7118b1b5f9145b84dfee0')

prepare() {
  cd "${_tarname}"
  sed -e 's|git ls-files|find|' \
      -e 's|~>|>=|g' \
      -i "${_gemname}.gemspec"
}

build() {
  cd "${_tarname}"
  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_tarname}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  # '--no-document' used because: https://github.com/sinatra/sinatra/issues/1082
  gem install \
    --ignore-dependencies \
    --no-document \
    --no-user-install \
    -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  rm -v "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install --verbose -Dm 644 "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
