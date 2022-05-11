# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bcrypt'
pkgname="ruby-${_gemname}"
pkgver=3.1.17
pkgrel=1
pkgdesc="bcrypt() is a sophisticated and secure hash algorithm designed by The OpenBSD project for hashing passwords. The bcrypt Ruby gem provides a simple wrapper for safely handling passwords"
arch=('x86_64')
url='https://github.com/codahale/bcrypt-ruby'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-rake' 'ruby-rake-compiler' 'ruby-rspec')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('34be6b896ddba5bf605774672d1a2e406c71d047b5e805949075f57906ca5d43a24853906a17da66d3477351bc57d2bbf783750ec49165da9f42cd347d5a54f1')

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
