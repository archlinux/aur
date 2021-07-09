# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='activemodel'
pkgname="ruby-${_gemname}"
pkgver=6.1.4
pkgrel=1
pkgdesc='A toolkit for building modeling frameworks (part of Rails).'
arch=('any')
url='http://www.rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activesupport')
makedepends=('ruby-rake')
#checkdepends=('ruby-bcrypt' 'ruby-builder' 'ruby-rails')
source=("rails-${pkgver}.tar.gz::https://github.com/rails/rails/archive/v${pkgver}.tar.gz")
sha512sums=('e88781c690b00441fda0d50514b3ce1dde2ba4c5b93c775a6f77d50bd9aa736631c4d8b1ca6f5d0e270b8ebe902f7945823df7d0d7513881fa6b35c03bcf388f')

prepare() {
  cd "rails-${pkgver}/${_gemname}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "rails-${pkgver}/${_gemname}"

  gem build "${_gemname}.gemspec"
}

# disable check() to make package updates possible
#check() {
#  cd "rails-${pkgver}/${_gemname}"
#
#  rake test
#}

package() {
  cd "rails-${pkgver}/${_gemname}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md README.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
