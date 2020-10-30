# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='molinillo'
pkgname="ruby-${_gemname}"
pkgver=0.7.0
pkgrel=1
pkgdesc='Provides support for dependency resolution'
arch=('any')
_github_namespace='https://github.com/CocoaPods/'
url="${_github_namespace}Molinillo"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rake' 'ruby-bundler' 'ruby-rdoc' 'git')
checkdepends=('ruby-rspec')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz" "git+${_github_namespace}Resolver-Integration-Specs#commit=53a8e313db92dab94384e9824bab469fc7144102")
sha512sums=('350cac48a42461df709fcec8a1b34d7d2a9141af7701403ca15263169baf6fc554653073739abe96a2d9bdc727e59690f12213076560a2e0614bbdfeba71275c'
            'SKIP')
prepare() {
  cd "${srcdir}/Molinillo-${pkgver}"

  sed -E 's|~>|>=|g' --in-place "${_gemname}.gemspec"
  sed --in-place 's/gem_tasks/setup/' Rakefile
  rm Gemfile.lock
  sed --in-place '/kicker/d' Gemfile
  sed --in-place '/codeclimate-test-reporter/d' Gemfile
  sed --in-place '/inch_by_inch/d' Gemfile
  sed --in-place '/rubocop/d' Gemfile

  mv ../Resolver-Integration-Specs/* spec/resolver_integration_specs/
}

build() {
  cd "${srcdir}/Molinillo-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/Molinillo-${pkgver}"
  rake spec
}

package() {
  cd "${srcdir}/Molinillo-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md CHANGELOG.md ARCHITECTURE.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
