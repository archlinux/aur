# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='test-unit-rr'
pkgname="ruby-${_gemname}"
pkgver=1.0.5
pkgrel=1
pkgdesc='test-unit-rr is a RR adapter for test-unit'
arch=('any')
url='https://github.com/test-unit/test-unit-rr'
license=('LGPL2.1')
makedepends=('ruby-rdoc' 'ruby-test-unit')
# we have a circular dependency here with ruby-rr. Both packages depend on each other.
depends=('ruby' 'ruby-rr')
options=(!emptydirs)
source=("https://github.com/test-unit/test-unit-rr/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f91e9d9c041b84c4eed80850c3d5e3567c7082d1a6643b6ffb4e3464184ed703f9e8f03a2f2cbd4acc7d9cb7ded3d60fe9db4d08ed19c7daf91d46a410d6c29a')

# update the gemspec to allow newer versions of rake
# remove deprecated options from the gemspec
prepare() {
  cd "${_gemname}-${pkgver}"
  sed --in-place 's/LGPLv2 or later/LGPL-2.1-or-later/' "${_gemname}.gemspec"
  sed --in-place '/spec.add_dependency("rr", ">= 1.1.1")/d' "${_gemname}.gemspec"
}


build() {
  cd "${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"
  ruby test/run-test.rb
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
