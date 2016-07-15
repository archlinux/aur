# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=em-proxy
pkgname=ruby-${_gemname}
pkgver=0.1.9
pkgrel=1
pkgdesc='EventMachine Proxy DSL for writing high-performance transparent / intercepting proxies'
url='https://github.com/igrigorik/em-proxy'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-eventmachine')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/igrigorik/em-proxy/archive/v${pkgver}.tar.gz)
sha512sums=('722b5010c8de9a809016b330e2123dc3bfb61e0c497844babb3af283e166271c00d74d58ca24c14e02b89346c114a2fd516a62ea00d5efe75981785719ad48e6')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i *.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build em-proxy.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" em-proxy*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
