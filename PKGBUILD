# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Harry <arandomawesomegeek@gmail.com>

_gemname='rails-dom-testing'
pkgname="ruby-${_gemname}"
pkgver=2.0.3
pkgrel=1
pkgdesc='Dom and Selector assertions for Rails applications'
arch=('any')
url='https://github.com/rails/rails-dom-testing'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activesupport' 'ruby-nokogiri')
makedepends=('ruby-bundler' 'ruby-rake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('0103cb494a28faa24c050c5659d7ac6858941f67fa977d1565193f30a2035b030450db4f091739cac86ff765677ea801bc7cd0966eea98866f5f582d8250d9b9')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
  rm Gemfile.lock
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
