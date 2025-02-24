# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=async-io
pkgname=ruby-${_gemname}
pkgver=1.43.2
pkgrel=1
pkgdesc='Provides support for asynchonous TCP, UDP, UNIX and SSL sockets'
url='https://github.com/socketry/async-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-async')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/socketry/async-io/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('7fd67a6df2000be71f0eb22466f4d770a2ccd1d6e63c6b7befe8b7fb0e899aa5')
sha512sums=('a73e254cf67a62a6dad58af2815cfd5bc2e7e8e9bfe4b909303b772fdc0b7569dde3855689d05fff1f44acbe1780099ec6bf2173b26c7e10b46a52eb1e030040')

prepare() {
  cd ${_gemname}-${pkgver}
  sed '/signing_key/d' -i ${_gemname}.gemspec
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

  install -Dm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 license.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/${_gemdir}"
  rm -rf cache gems/${_gemname}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
