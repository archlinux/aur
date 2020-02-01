# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='hocon'
pkgname="ruby-${_gemname}"
pkgver=1.3.0
pkgrel=2
pkgdesc='A collection of text algorithms: Levenshtein, Soundex, Metaphone, Double Metaphone, Porter Stemming'
arch=('any')
url='https://github.com/puppetlabs/ruby-hocon'
license=('Apache')
depends=('ruby')
makedepends=('ruby-rdoc')
checkdepends=('ruby-rspec')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('67a69b516197b4a0e64c275fe4b930a3b1128ef1949c47263ba9a20bd8397152a2a5dce0c64ce54dbcf7bd3c81d77aa2fb450e12f5aa7bacb0c85e61083904f6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # update the gemspec to allow newer versions of rake
  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"

  # fix wrong license name in gemspec
  sed --in-place 's/Apache License, v2/Apache-2.0/' "${_gemname}.gemspec"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rspec spec
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 CHANGELOG.md HISTORY.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
