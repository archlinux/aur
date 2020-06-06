# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='cool.io'
pkgname="ruby-${_gemname}"
pkgver=1.6.0
pkgrel=0
pkgdesc='provides a high performance event framework for Ruby which uses the libev C library.'
arch=('x86_64')
url='https://github.com/tarcieri/cool.io'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc' 'ruby-bundler' 'ruby-rake-compiler')
checkdepends=('ruby-rake' 'ruby-rspec')
source=("${url}/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz")
options=("!emptydirs")
sha512sums=('0523b4af2560afa19dfa87feeda7f9bfe36dd08f4a0e77ff344b9083f6b3e80e4824e5e83fad80bf98ec4f88b2a36ca07b7a01be5a60c154c76f44621a404d2a')
provides=(
  cool.io_ext.so
  iobuffer_ext.so
)
build() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # update the gemspec to allow newer versions of rake
  sed --in-place 's|~>|>=|g' "${_gemname}.gemspec"
  sed --in-place 's|git ls-files|find|g' "${_gemname}.gemspec"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  # Two tests fail if /etc/resolv.conf contains an IPv6 address
  # https://github.com/tarcieri/cool.io/issues/68
  rake
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 CHANGES.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext"
  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
