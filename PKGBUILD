# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='activemodel'
pkgname="ruby-${_gemname}"
pkgver=6.1.3.2
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
sha512sums=('3b30facfe0555c3161b5fc50efb7dc1f3df0eeadbfa19f16df3ebdb4877d6fb9a978ae7a6713a502d79e6d8f1be20157bd5ef64919fdd558cad89492cc2d9672')

prepare() {
  cd "rails-${pkgver}/${_gemname}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "rails-${pkgver}/${_gemname}"

  gem build "${_gemname}.gemspec"
}

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
