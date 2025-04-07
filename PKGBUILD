# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='actioncable'
pkgname="ruby-${_gemname}"
pkgver=8.0.2
pkgrel=1
pkgdesc='Structure many real-time application concerns into channels over a single WebSocket connection'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-nio4r' 'ruby-websocket-driver')
source=("https://github.com/rails/rails/archive/v${pkgver}/rails-${pkgver}.tar.gz")
sha256sums=('a63557570d8776897511604ab89b0d2fb413d2089ecd7627d4f250b4837b6db0')

prepapare() {
  cd "rails-${pkgver}/${_gemname}"

  # update gemspec to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "rails-${pkgver}/${_gemname}"

  gem build "${_gemname}.gemspec"
}

package() {
  cd "rails-${pkgver}/${_gemname}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
