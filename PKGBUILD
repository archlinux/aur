# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

_gemname=hitimes
pkgname=ruby-${_gemname}
pkgver=1.3.0
pkgrel=1
pkgdesc='Fast, high resolution timer library for recording performance metrics'
url='https://github.com/copiousfreetime/hitimes'
arch=('x86_64')
license=('ISC')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/copiousfreetime/hitimes/archive/v${pkgver}.tar.gz)
sha256sums=('194a75069de5165739a6108c9a039be0bf30583ae50609d46fb142dc29fe9ff9')
sha512sums=('215ce983345fb1ecceb381d2e9cb7079e1eadaa0eb118052a569cf7239e3fd12f9799a769bf03abb17185326804da6ca6dce5e0c16f6c126e1992e7ff02e1113')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r "s|(s.version =) \".+\"|\1 \"${pkgver}\"|g" -i ${_gemname}.gemspec
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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}/${_gemdir}" \( -name '*.log' -or -name 'gem_make.out' \) -delete
}

# vim: ts=2 sw=2 et:
