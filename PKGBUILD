# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=async-io
pkgname=ruby-${_gemname}
pkgver=1.0.0
pkgrel=2
pkgdesc='Provides support for asynchonous TCP, UDP, UNIX and SSL sockets'
url='https://github.com/socketry/async-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-async')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/socketry/async-io/archive/v${pkgver}.tar.gz)
sha256sums=('a261535e8a9b22b3c8f62c59794b5012eadb7382220c0ab957a079a978d194cf')
sha512sums=('54b45de9a37438a5db6264aab0d31dfed521b3086a8cd52ddc97b7bbf3742307399da829ee7892ecc6742f2c1111c0903d91f2ea168fff06c6f6319424382e4f')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
  sed 's|~>|>=|g' -i ${_gemname}.gemspec # don't give a fuck about rubys bla bla
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}"/${_gemdir}/cache/${_gemname}-${pkgver}.gem
}

# vim: ts=2 sw=2 et:
