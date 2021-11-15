# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='railties'
pkgname="ruby-${_gemname}"
pkgver=6.1.4.1
pkgrel=2
pkgdesc='Tools for creating, working with, and running Rails applications'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-method_source' 'ruby-rake' 'ruby-thor')
#checkdepends=('ruby-bundler' 'ruby-mysql2')
source=("rails-${pkgver}.tar.gz::https://github.com/rails/rails/archive/v${pkgver}.tar.gz")
sha512sums=('411d3fe21c7500e884edb86cc6728c4d3b7125d2e6ea913191437716f2be0d522252c55c25cb4c5221cc112b3ca5eeba690b0b0e59572fcc54ea42ba05ec4520')

prepare() {
  cd "rails-${pkgver}/${_gemname}"

  sed -r 's|~>|>=|g' -i "${_gemname}.gemspec"
  rm ../Gemfile.lock
}

build() {
  cd "rails-${pkgver}/${_gemname}"

  gem build "${_gemname}.gemspec"
}

#check() {
#  cd "rails-${pkgver}/${_gemname}"
#
#  rake test --trace
#}

package() {
  cd "rails-${pkgver}/${_gemname}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md RDOC_MAIN.rdoc README.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
