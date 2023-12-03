# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Colin Arnott <colin@urandom.co.uk>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bcrypt'
pkgname="ruby-${_gemname}"
pkgver=3.1.20
pkgrel=1
pkgdesc="bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords. The bcrypt Ruby gem provides a simple wrapper for safely handling passwords"
arch=('x86_64')
url='https://github.com/codahale/bcrypt-ruby'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-rake' 'ruby-rake-compiler' 'ruby-rspec')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a89e992a8684211fda22074269000475f7975dd41f05f9b1c2acd82e7a7e084134dc33c66053b315dc918f848330f2990545e7c806c17b69cdffbf2b382e0f4d')

prepare() {
  cd "bcrypt-ruby-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "bcrypt-ruby-${pkgver}"

  rake gem
}

package() {
  cd "bcrypt-ruby-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
