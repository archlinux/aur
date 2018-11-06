# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=async-io
pkgname=ruby-${_gemname}
pkgver=1.16.3
pkgrel=1
pkgdesc='Provides support for asynchonous TCP, UDP, UNIX and SSL sockets'
url='https://github.com/socketry/async-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-async')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/socketry/async-io/archive/v${pkgver}.tar.gz)
sha256sums=('337f9bb7020df00e0f4228f5728835352b3d452ed61b7538e197c6a55e9893aa')
sha512sums=('710f304e79760c022c29583435e488f100c62bb3a298b417bfb82d9fd2189123fe29bbcd28ac4965c0a159c9724bf4f84e3f7cdc589ff95c56bad94b80bc1c6a')

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
  install -Dm 644 README.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}"/${_gemdir}/cache/${_gemname}-${pkgver}.gem
}

# vim: ts=2 sw=2 et:
