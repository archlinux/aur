# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

_gemname=hitimes
pkgname=ruby-${_gemname}
pkgver=1.2.6
pkgrel=2
pkgdesc='Fast, high resolution timer library for recording performance metrics'
url='https://github.com/copiousfreetime/hitimes'
arch=('x86_64')
license=('ISC')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/copiousfreetime/hitimes/archive/v${pkgver}.tar.gz)
sha256sums=('74c74059475c44971500604027847af4489f5e017fca8818d20fd30b5a6c8b06')
sha512sums=('8299227a996d4fcd0eaa33c9bdc83e78604494f9d4a4194d826de85444d35013e864594a36bdaf0e037b5a46d333ef3e8d0ed9dcbccb10e425b85a5f761613e5')

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
