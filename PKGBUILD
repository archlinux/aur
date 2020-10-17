# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_gemname='text'
pkgname="ruby-${_gemname}"
pkgver=1.3.1
pkgrel=5
pkgdesc='A collection of text algorithms: Levenshtein, Soundex, Metaphone, Double Metaphone, Porter Stemming'
arch=(any)
url='https://github.com/threedaymonk/text'
license=('MIT')
makedepends=('ruby-rdoc')
checkdepends=('ruby-test-unit' 'ruby-rake')
depends=('ruby')
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('eaf3ce2d5a8d5cc27b6b9c5b820ffede864466a460dd1a64a1141adf1ee78a616684b484e0548ba8eb47c492f02244ffc06058a87b3ad5c2116929e9e8fe10a8')

# update the gemspec to allow newer versions of rake
# remove deprecated options from the gemspec
prepare() {
  cd "${_gemname}-${pkgver}"

  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"
  sed --in-place '/s.rubyforge_project/d' "${_gemname}.gemspec"
  sed --in-place '/s.has_rdoc/d' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 COPYING.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}
# vim: ts=2 sw=2 et:
