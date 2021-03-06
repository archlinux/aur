# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='bigdecimal'
pkgname="ruby-${_gemname}"
pkgver=3.0.0
pkgrel=1
pkgdesc='This library provides arbitrary-precision decimal floating-point number class.'
arch=('x86_64')
url="https://github.com/ruby/bigdecimal"
license=(RUBY)
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rake-compiler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('40939cf68da783164344b1e8b97b9b7c068ca8946b229f00f264d462ff54ef71008108630e5e2606b4cfb51705df15b0428231082a212be614d37ef0bcf28185')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 CHANGES.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
