# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contrubutor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='railties'
pkgname="ruby-${_gemname}"
pkgver=8.0.2
pkgrel=3
pkgdesc='Tools for creating, working with, and running Rails applications'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-method_source' 'ruby-rake' 'ruby-thor')
#checkdepends=('ruby-bundler' 'ruby-mysql2')
source=("https://github.com/rails/rails/archive/v${pkgver}/rails-${pkgver}.tar.gz")
sha512sums=('d359714b510efe2876b8c800cc1faba517f5586c50c755428b73bf8e659ba915d10390c9992bb2b6915b229ce86a801862d26bbd43be965e081cdb12c9bb8e21')

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
  install -Dm 644 CHANGELOG.md RDOC_MAIN.md README.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
