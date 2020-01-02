# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: bastelfreak

_gemname='gettext'
pkgname="ruby-${_gemname}"
pkgver=3.2.9
pkgrel=2
pkgdesc='Gettext gem is a pure Ruby Localization(L10n) library and tool which is modeled after the GNU gettext package.'
arch=(any)
url="https://github.com/ruby-gettext/gettext"
license=('RUBY' 'LGPL3')
makedepends=('ruby-rdoc' 'ruby-test-unit' 'ruby-rake' 'ruby-yard' 'ruby-irb' 'ruby-bundler')
depends=('ruby' 'ruby-locale' 'ruby-text')
source=("https://github.com/ruby-gettext/gettext/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('e7352a343485c25077cdf08f2f92d7ae7ba798cb662ad090ce9e367576ee585753588dca2b7c8247ad007a816b87e57027ce70160b8f1bee83e3276e3725f314')

# update the gemspec to allow newer versions of rake
# remove deprecated options from the gemspec
prepare() {
  cd "${_gemname}-${pkgver}"

  sed --in-place '/s.rubyforge_project/d' "${_gemname}.gemspec"
  sed --in-place '/test\/unit\/notify/d' test/run-test.rb
  sed --in-place '/test\/unit\/rr/d' test/run-test.rb
  sed --in-place '/s.add_development_dependency("test-unit-notify")/d' "${_gemname}.gemspec"
  sed --in-place '/s.add_development_dependency("test-unit-rr")/d' "${_gemname}.gemspec"
}


build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

# tests are currently broken upstream
#check() {
  #cd "${_gemname}-${pkgver}"
  #rake test
#}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}
