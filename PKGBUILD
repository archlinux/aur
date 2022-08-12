# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Nathan Phillip Brink <binki@gentoo.org>

_gemname="sprockets-rails"
pkgname="ruby-${_gemname}"
pkgver=3.4.2
pkgrel=1
pkgdesc='Sprockets Rails integration'
arch=('any')
url='https://github.com/rails/sprockets-rails'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionpack' 'ruby-activesupport' 'ruby-sprockets')
#checkdepends=('ruby-bundler' 'ruby-rails' 'ruby-rake')
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('a01a23b189bc0fcde8fa3a0734c239dc9ee9119ca7a0828f04974cc28344e6c5743a6f60f1ab8ae8ed28c0e111103948209593ccd88dc974e2d12b55a1a2b49a')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

#check() {
#  cd "${_gemname}-${pkgver}"
#
#  rake test
#}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
