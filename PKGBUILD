# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='activeresource'
pkgname="ruby-${_gemname}"
pkgver=6.0.0
pkgrel=1
pkgdesc='REST on Rails. Wrap your RESTful web app with Ruby classes and work with them like Active Record models'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activemodel' 'ruby-activemodel-serializers-xml' 'ruby-activesupport')
makedepends=('ruby-bundler' 'ruby-rake')
source=("https://github.com/rails/activeresource/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e9c5d78faaba803aae7bf340f26b2354b60d2905fa2dff0904b99df1c68c9118bfded0e7ee4f19442eb177964a209337a7d9c4c74f494b10880ea9b996e0acb6')

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
