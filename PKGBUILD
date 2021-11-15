# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='activeresource'
pkgname="ruby-${_gemname}"
pkgver=5.1.1
pkgrel=2
pkgdesc='REST on Rails. Wrap your RESTful web app with Ruby classes and work with them like Active Record models'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activemodel' 'ruby-activemodel-serializers-xml' 'ruby-activesupport')
makedepends=('ruby-bundler' 'ruby-rake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rails/activeresource/archive/v${pkgver}.tar.gz")
sha512sums=('12cf375f0ec563a06400484341363ce9e8b3a55ca5ed06d6de3ca3b8f1083f0c1073b2c7deec2eb551061a9425d3531d8abf2c05d18f94d187e214b356d43dc7')

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
  install -Dm 644 CHANGELOG.md CONTRIBUTING.md README.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
