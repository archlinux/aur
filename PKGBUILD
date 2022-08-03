# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=async-io
pkgname=ruby-${_gemname}
pkgver=1.33.0
pkgrel=1
pkgdesc='Provides support for asynchonous TCP, UDP, UNIX and SSL sockets'
url='https://github.com/socketry/async-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-async')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/socketry/async-io/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('33ad6264f0070fb1568cd02fd5c89b4705b86b878f7f5a7b2441af6d7ff03c90')
sha512sums=('5c70179df163952754bcdd506e13d83f1b039d434e7c6c692ead80f0efebc1ffd17e47c9cf53fe6d29bfd452551098bf31d8a463ed212d54a4910eef93fac6b7')

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
