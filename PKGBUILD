# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=async-io
pkgname=ruby-${_gemname}
pkgver=1.27.0
pkgrel=3
pkgdesc='Provides support for asynchonous TCP, UDP, UNIX and SSL sockets'
url='https://github.com/socketry/async-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-async')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/socketry/async-io/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e085a1d39f7c6c7c5a89ac97b5f83aeee328cca4d809c9ea9d467e44ccb8866a')
sha512sums=('8b5e4b182e4ee31ddbeef1a882cde8e70c820947e45226bea1a5ce35a35ed441629463d7da027057fca339c0e8fcb063406e797387bb29965b451998ceb67d51')

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
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/${_gemdir}"
  rm -rf cache gems/${_gemname}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
