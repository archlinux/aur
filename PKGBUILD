# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Nathan Phillip Brink <binki@gentoo.org>

_gemname="sprockets-rails"
pkgname="ruby-${_gemname}"
pkgver=3.3.0
pkgrel=1
pkgdesc='Sprockets Rails integration'
arch=('any')
url='https://github.com/rails/sprockets-rails'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-sprockets')
checkdepends=('ruby-bundler' 'ruby-rails' 'ruby-rake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rails/sprockets-rails/archive/v${pkgver}.tar.gz")
sha512sums=('f6bc9920f19ac76e383a36ed550f06b16a4de628a8df15c6e70f005fe60c0050a01002c9334359adfb182b449a8baaec35733c846240258702a430f14dcdefe2')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
