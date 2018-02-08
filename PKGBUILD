# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=async-io
pkgname=ruby-${_gemname}
pkgver=1.2.1
pkgrel=1
pkgdesc='Provides support for asynchonous TCP, UDP, UNIX and SSL sockets'
url='https://github.com/socketry/async-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-async' 'ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/socketry/async-io/archive/v${pkgver}.tar.gz)
sha256sums=('b7644b5ed608de28ee307b217de488ac8fd6b6b86dcc286fd26f4820d47a64de')
sha512sums=('d3980ee946c7a3cb8bf1d16cc4a18e7f0af93d014dc5ec2e4a9a8db4f61670e0479955a68e07f82cf117b5123161a440b7a1b03f981627a4e6c3790436a7247e')

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
