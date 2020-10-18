# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>
# Contributor: Tim Meusel <tim@bastelfreak.de>

_gemname='locale'
pkgname="ruby-${_gemname}"
pkgver=2.1.3
pkgrel=1
pkgdesc='A pure ruby library which provides basic and general purpose APIs for localization.'
arch=('any')
url="https://github.com/ruby-gettext/locale"
license=('RUBY' 'LGPL3')
makedepends=('ruby-rdoc' 'ruby-rake' 'ruby-bundler' 'ruby-yard')
checkdepends=('ruby-test-unit' 'ruby-test-unit-rr')
depends=('ruby')
options=(!emptydirs)
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('77877f15914dbee5ca83155f8cb84815296b4e2e4205218c9926e0265b40940cbdbe68fb048870ce4f53a6caeeb593813a2e16e8c130a19e44a28cb67c82fe25')

build() {
  cd "${_gemname}-${pkgver}"
  # remove dependencies that aren't actual dependencies
  sed --in-place '/test\/unit\/notify/d' test/run-test.rb
  sed --in-place '/s.add_development_dependency("redcarpet")/d' "${_gemname}.gemspec"
  sed --in-place '/s.add_development_dependency("test-unit-notify")/d' "${_gemname}.gemspec"
  rake build
}

check() {
  cd "${_gemname}-${pkgver}"
  rake test
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 README.rdoc ChangeLog doc/text/news.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
