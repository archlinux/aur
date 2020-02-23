# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: tim@bastelfreak.de

_gemname='gettext'
pkgname="ruby-${_gemname}"
pkgver=3.3.5
pkgrel=1
pkgdesc='Gettext gem is a pure Ruby Localization(L10n) library and tool which is modeled after the GNU gettext package.'
arch=(any)
url="https://github.com/ruby-gettext/gettext"
license=('RUBY' 'LGPL3')
makedepends=('ruby-rdoc' 'ruby-yard' 'ruby-bundler')
depends=('ruby' 'ruby-locale' 'ruby-text')
checkdepends=('ruby-test-unit' 'ruby-rake' 'ruby-test-unit-rr')
source=("https://github.com/ruby-gettext/gettext/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('58f3f975e6ac30d95f422f5e8a07d10de12584af4e3687f8039d843326257dc7b43cb54a1e0ab28e2f7c171ce4b1c6213919455aa953bcf012b6b89b1f3fabab')

# update the gemspec to allow newer versions of rake
# remove deprecated options from the gemspec
prepare() {
  cd "${_gemname}-${pkgver}"

  sed --in-place 's/s.license.*/s.licenses = ["Ruby", "LGPL-3.0+"]/' "${_gemname}.gemspec"
  sed --in-place '/test\/unit\/notify/d' test/run-test.rb
  sed --in-place '/s.add_development_dependency("test-unit-notify")/d' "${_gemname}.gemspec"
}


build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

# tests are currently broken upstream
check() {
  cd "${_gemname}-${pkgver}"
  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}
