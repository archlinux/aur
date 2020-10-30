# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='x25519'
pkgname="ruby-${_gemname}"
pkgver=1.0.8
pkgrel=1
pkgdesc='An efficient public key cryptography library for Ruby providing key exchange/agreement via the X25519 (a.k.a. Curve25519) Elliptic Curve Diffie-Hellman function as described in RFC 7748'
arch=('x86_64')
url='https://github.com/RubyCrypto/x25519'
license=('BSD')
depends=('ruby')
makedepends=('ruby-rake' 'ruby-bundler' 'ruby-rdoc' 'ruby-rake-compiler')
checkdepends=('ruby-rspec')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('42a9a2f1c470ea82c070435e4d85317c69fbd6e994f765c46b3aa4b544a5557559ff36194e37100bd8f581711156d185117535aeb3da9f5b6b5523e5a4b347b6')
provides=('x25519_precomputed.so' 'x25519_ref10.so')
prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  sed -E 's|~>|>=|g' --in-place "${_gemname}.gemspec"
  sed --in-place 's|`git ls-files -z`|`find . -print0`|' "${_gemname}.gemspec"
  sed --in-place '/rubocop/Id' Rakefile Gemfile
  sed --in-place '/coveralls/Id' Gemfile spec/spec_helper.rb
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake compile
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake spec
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md CHANGES.md CODE_OF_CONDUCT.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  rm -rf ${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/{ext,tmp}
  rm -rf "${pkgdir}/${_gemdir}/cache"
  rm -rf ${pkgdir}/${_gemdir}/extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
