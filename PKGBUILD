# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>

_gemname=power_assert
pkgname="ruby27-${_gemname}"
pkgver=2.0.0
pkgrel=1
pkgdesc='Power Assert for Ruby'
arch=('any')
url="https://github.com/ruby/${_gemname}"
license=('custom:BSDL')
depends=('ruby2.7')
makedepends=('ruby27-rdoc' 'ruby27-rake')
checkdepends=('ruby27-test-unit')
options=('!emptydirs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz" 'disable-irb-1.3.1-and-newer-specific-test.patch')
sha512sums=('e6faf3cf50d2c70ae421bae20b885ac858fe11b10b1a8562d9ca88afbd397fa4812631f2aa02638c273eed518091dfaa020b6c002c0559383ddca625404bcc1c'
            '7e959ac2b2170e7465cdb7b1a76740c8e84013b2f5c479574e9412aa252891d8713813c416679b79b19ae32693a4e1f032f4349018dcb69c2bacbe9727d65be5')

prepare() {
  cd "${_gemname}-${pkgver}"
  sed --in-place 's|`git ls-files -z`|`find . -print0`|' "${_gemname}.gemspec"
  sed --in-place '/bundler/d' Rakefile
  patch --forward --verbose --strip=1 --input='../disable-irb-1.3.1-and-newer-specific-test.patch'
}

build() {
  cd "${_gemname}-${pkgver}"
  gem-2.7 build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"
  ruby27-rake test
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm -rf "${pkgdir}/${_gemdir}/cache"
  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/.github"

  install -Dm 644 README.md  -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 BSDL COPYING LEGAL -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
