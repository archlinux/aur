# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='rack-cache'
pkgname="ruby-${_gemname}"
pkgver=1.12.1
pkgrel=1
pkgdesc="Real HTTP Caching for Ruby Web Apps"
arch=('any')
url='https://github.com/rtomayko/rack-cache'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-rack')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f850facb28f302db819b6d67fd86e0dd18ae8f5d132044582bbcd6792b287c7d4a29219a47e708b5047fb373b5857632597d9743b4ba530b1258d29924ca4cf9')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGES README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
