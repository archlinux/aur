# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Mario Finelli <mario at finel dot li>

_gemname='puppet_forge'
pkgname="ruby-${_gemname}"
pkgver=2.3.3
pkgrel=1
pkgdesc='Ruby client for the Puppet Forge API. Access and manipulate the Puppet Forge API from Ruby.'
arch=('any')
url='https://github.com/puppetlabs/forge-ruby'
license=('Apache')
makedepends=('ruby-rdoc' 'ruby-rspec' 'ruby-bundler')
depends=('ruby' 'ruby-faraday' 'ruby-faraday-middleware' 'ruby-gettext-setup' 'ruby-semantic_puppet' 'ruby-minitar')
source=("https://github.com/puppetlabs/forge-ruby/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('990ba97406a04df90d8b809ff68cfac524e1b61d6dfff3251c1ea674d85485fae686e734559d1b1f0048eb9a4c17d35bcf7a4692bd9a8ad8c7868ae94a5bc9bf')

# update the gemspec to allow newer versions of rake
# remove deprecated options from the gemspec
prepare() {
  cd "forge-ruby-${pkgver}"
  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"
  # We don't download a git archive, so this won't work
  sed --in-place 's|spec.files .*|spec.files         = `find`.split("\\n")|' "${_gemname}.gemspec"
  # Allow latest ruby-faraday version
  sed --in-place 's/spec.add_runtime_dependency "faraday",.*/spec.add_runtime_dependency "faraday"/' "${_gemname}.gemspec"
  # Allow latest ruby-faraday_middleware version. Already fixed at master
  sed --in-place 's/spec.add_runtime_dependency "faraday_middleware",.*/spec.add_runtime_dependency "faraday_middleware"/' "${_gemname}.gemspec"
}

build() {
  cd "forge-ruby-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "forge-ruby-${pkgver}"
  # https://tickets.puppetlabs.com/browse/FORGE-535
  # tests are currently, in parts, broken
  #rspec
}

package() {
  cd "forge-ruby-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
