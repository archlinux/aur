# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Nathan Phillip Brink <binki@gentoo.org>

_gemname="sprockets-rails"
pkgname="ruby-${_gemname}"
pkgver=3.4.0
pkgrel=1
pkgdesc='Sprockets Rails integration'
arch=('any')
url='https://github.com/rails/sprockets-rails'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-sprockets')
checkdepends=('ruby-bundler' 'ruby-rails' 'ruby-rake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rails/sprockets-rails/archive/v${pkgver}.tar.gz")
sha512sums=('38ebadc351b807382be05e6e070f572a32b96a9b19572fff46eac3cf89574aa27c1ca1ae4419b626e3024cc79684423380e051c69d86dbec73284c50c1d1729c')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
