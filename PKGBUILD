# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Mario Finelli <mario at finel dot li>

_gemname='puppet_forge'
pkgname="ruby-${_gemname}"
pkgver=2.3.4
pkgrel=1
pkgdesc='Ruby client for the Puppet Forge API. Access and manipulate the Puppet Forge API from Ruby.'
arch=('any')
url='https://github.com/puppetlabs/forge-ruby'
license=('Apache')
makedepends=('ruby-rdoc' 'ruby-bundler')
checkdepends=('ruby-rspec')
depends=('ruby' 'ruby-faraday' 'ruby-faraday-middleware' 'ruby-gettext-setup' 'ruby-semantic_puppet' 'ruby-minitar')
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('cc0e95e2ae4c94268b647a664f9b07ff3e5f60d01ef2b37602763f7bd9b68e3543abca8b45c5a9007b418c35c7108bc3d75df721bf78d9318717caf3ccbb905c')

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
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
