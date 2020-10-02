# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='cool.io'
pkgname="ruby-${_gemname}"
pkgver=1.7.0
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
sha512sums=('5bae91a4db83999922e8b75e2ba943d0a211636456bb197d914acaae0ead3e7575d6eb52cd9228304941c4f4b8274a82ca302a54d1484e894361a68038b20f24')
provides=(
  cool.io_ext.so=${pkgver}
  iobuffer_ext.so=${pkgver}
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
  rm -r ${pkgdir}/${_gemdir}/extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
