# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Nathan Phillip Brink <binki@gentoo.org>

_gemname="sprockets-rails"
pkgname="ruby-${_gemname}"
pkgver=3.2.2
pkgrel=2
pkgdesc='Sprockets Rails integration'
arch=('any')
url='https://github.com/rails/sprockets-rails'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-sprockets')
makedepends=('ruby-bundler' 'ruby-rails' 'ruby-rake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rails/sprockets-rails/archive/v${pkgver}.tar.gz")
sha512sums=('048f48930325316ac28d721a2c33ba60767dfec9456b0705e90363a1c81c8876ec6f99d65ce533d5a0704e1f67a33fcac5cd675aec5cc3c3f1cd896d518865a9')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

# test have been disabled for now: https://github.com/rails/sprockets-rails/issues/473
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

  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
