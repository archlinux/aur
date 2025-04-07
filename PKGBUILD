# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Nathan Phillip Brink <binki@gentoo.org>

_gemname="sprockets-rails"
pkgname="ruby-${_gemname}"
pkgver=3.5.2
pkgrel=1
pkgdesc='Sprockets Rails integration'
arch=('any')
url='https://github.com/rails/sprockets-rails'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-sprockets')
#checkdepends=('ruby-bundler' 'ruby-rails' 'ruby-rake')
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('868dcdd7580a4c0fd8ab5632cc235e8f558f57e158508107a8ff1cca4264a7caa611a4e75126997b7bad421f91362c00463ee112c29a7458d53a5c1f81d6565d')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

#check() {
#  cd "${_gemname}-${pkgver}"
#
#  rake test
#}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
