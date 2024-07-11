# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=async-io
pkgname=ruby-${_gemname}
pkgver=1.42.1
pkgrel=1
pkgdesc='Provides support for asynchonous TCP, UDP, UNIX and SSL sockets'
url='https://github.com/socketry/async-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-async')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/socketry/async-io/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e1cc2b732ee3e62c43a71770261b033290fdc8ddf885cac7b8cca7546cf9063b')
sha512sums=('039dd1dc4b93c9cdec591b435a2834727580df6f1569956b310e1566ada1932b29fbc39515ba8bae862fb2970e3d91cbbc90d4fc3b197f8381acf6d5cdf4f2a5')

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
