# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='ed25519'
pkgname="ruby-${_gemname}"
pkgver=1.2.4
pkgrel=1
pkgdesc='A Ruby binding to the Ed25519 elliptic curve public-key signature system described in RFC 8032.'
arch=('x86_64')
url='https://github.com/RubyCrypto/ed25519'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rake' 'ruby-bundler' 'ruby-rdoc' 'ruby-rake-compiler')
checkdepends=('ruby-rspec')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('cf2de7781848d804f3a279baef26f887846d7d846d225293c74dc3f4e301d18518c9edc8b721f9637fff8f087703e91d2376119f2d8185ef19be5862f99801b3')
provides=('ed25519_ref10.so')
prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  sed -E 's|~>|>=|g' --in-place "${_gemname}.gemspec"
  sed --in-place 's|`git ls-files -z`|`find . -print0`|' "${_gemname}.gemspec"
  sed --in-place '/rubocop/Id' Rakefile Gemfile
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
  install -Dm 644 README.md CHANGES.md ed25519.png CODE_OF_CONDUCT.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  rm -rf ${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/{ext,tmp}
  rm -rf "${pkgdir}/${_gemdir}/cache"
  rm -rf ${pkgdir}/${_gemdir}/extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
