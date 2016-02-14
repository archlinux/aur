# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=network_interface
pkgname=ruby-${_gemname}
pkgver=0.0.1
pkgrel=2
pkgdesc='Library to get network interface information'
url='https://github.com/rapid7/network_interface'
arch=('i686' 'x86_64')
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rapid7/network_interface/archive/v${pkgver}.tar.gz)
sha512sums=('d6ef7b82b2e3b4834b1eede2734bbef80c5a635ac62db33b3b3ba5660910c4cbc38c270e3b4e5be039217ba20e7064da172869cf7553a62db9526bcb43bf1013')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i *.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build network_interface.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" network_interface*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -name gem_make.out -o -name gem.build_complete -o -name mkmf.log | xargs rm
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
