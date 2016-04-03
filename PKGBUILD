# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

_gemname=hitimes
pkgname=ruby-${_gemname}
pkgver=1.2.3
pkgrel=1
pkgdesc='Fast, high resolution timer library for recording performance metrics'
url='https://github.com/copiousfreetime/hitimes'
arch=('i686' 'x86_64')
license=('ISC')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/copiousfreetime/hitimes/archive/v${pkgver}.tar.gz)
sha512sums=('f547507f7346ecfcd80a3d7e7706fa6ec46c969d1d6e81a243a009c1d00adff5ededde945512045e2774f92622f25b9e9d590d6e47ea890edaab2ad66016ec75')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|1.2.2|1.2.3|g' -i *.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build hitimes.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" hitimes*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}/${_gemdir}" -name '*.log' -or -name 'gem_make.out' -delete
}

# vim: ts=2 sw=2 et:
