# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
_gemname='activeresource'
pkgname="ruby-${_gemname}"
pkgver=6.1.0
pkgrel=1
pkgdesc='REST on Rails. Wrap your RESTful web app with Ruby classes and work with them like Active Record models'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activemodel' 'ruby-activemodel-serializers-xml' 'ruby-activesupport')
makedepends=('ruby-bundler' 'ruby-rake')
source=("https://github.com/rails/activeresource/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('aa8fe0f015cf8c247f7f9734be9206ee7bc488b1e47804dc45b085161638d112815d0ddcf27a65b4b1bf7ba67d9c28a6b7beb515ae411470b3936dc535923b45')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
