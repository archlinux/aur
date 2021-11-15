# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='hirb'
pkgname="ruby-${_gemname}"
pkgver=0.7.3
pkgrel=2
pkgdesc="Provides a mini view framework for console applications and uses it to improve ripl(irb)'s default inspect output"
arch=('any')
url='http://tagaholic.me/hirb/'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-rake')
#checkdepends=('ruby-bacon' 'ruby-bacon-bits' 'ruby-mocha' 'ruby-mocha-on-bacon')
source=("https://github.com/cldwalker/hirb/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('45b0ded2bd4b184b4a07b3b00374a00f1bfdeba64e1a68f0727ffc3f9ee25257114427cd7018fef94f452b1154ad0c5ab48ebdc4f075bee41dcce3824aa33d7f')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' .gemspec
}

build() {
  cd "${_gemname}-${pkgver}"

  rake gem
}

#check() {
#  cd "${_gemname}-${pkgver}"
#
#  rake test
#}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.rdoc CONTRIBUTING.md README.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
