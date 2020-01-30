# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: tim@bastelfreak.de

_gemname='gettext'
pkgname="ruby-${_gemname}"
pkgver=3.3.2
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
sha512sums=('7d2818af2d622a46609103493cb5e82856e1a9f3ae67fad824bcbc2e11fca65040021554515a476e3a079a02d0636e9fe3afa706242795d0fb1037e8f7b374a6')

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
