# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bcrypt'
pkgname="ruby-${_gemname}"
pkgver=3.1.16
pkgrel=1
pkgdesc="bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords. The bcrypt Ruby gem provides a simple wrapper for safely handling passwords."
arch=('x86_64')
url='https://github.com/codahale/bcrypt-ruby'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-rake' 'ruby-rake-compiler' 'ruby-rspec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('37d2a7394c8d4ffe722a93722e821b684cfb5966014f1b0aea1d0145de1830598b6619d34b69e9d0982bd60dc71b2f78cf4b81702f9f01da2c8cdd3e66f82e8d')

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
