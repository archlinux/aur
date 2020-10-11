# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='gemstash'
pkgname="${_gemname}"
pkgver=2.1.0
pkgrel=1
pkgdesc='Acts as a local RubyGems server, caching copies of gems from RubyGems.org automatically, and eventually letting you push your own private gems as well.'
arch=('any')
url='https://github.com/rubygems/gemstash'
license=('MIT')
makedepends=('ruby-rdoc' 'ruby-rake' 'ruby-bundler' 'pandoc')
checkdepends=('ruby-rspec')
# gemstash depends on more gems, but those are currently not available :sadface:
depends=('ruby')
source=("${url}/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz" 'disable-rubocop.patch')
options=("!emptydirs")
sha512sums=('e498cbdffa4d3b6edc8dd4e5220c0b55919130eb7d8a0891c34538bd262bed074f8cdda3382a8cbb2aa6385151a2c02c6c6084db7117cc3b8ed7f559cd4aa35a'
            '7bf09636dc906348821aa4cd065f3e5d74218b781f4c998127ce78a5bd613bd50b31f8811d052938d5b88783c053b385ad85ac0ab4235bb2fa82ac81956a9929')

# disable cloud metric reporting during tests
prepare() {
  cd "${_gemname}-${pkgver}"

  patch --forward --verbose --strip=1 --input='../disable-rubocop.patch'
  sed --in-place 's|`git ls-files -z`.split("\\x0")|`find * -print`.split("\\n")|' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
  rake doc
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  # tests currently disabled because aruba/rubocop isn't available as package
  #rspec
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm -rf "${pkgdir}/${_gemdir}/cache"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md CODE_OF_CONDUCT.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
