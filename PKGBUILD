# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

_gemname=hitimes
pkgname=ruby-${_gemname}
pkgver=2.0.0
pkgrel=3
pkgdesc='Fast, high resolution timer library for recording performance metrics'
url='https://github.com/copiousfreetime/hitimes'
arch=('x86_64')
license=('ISC')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/copiousfreetime/hitimes/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3cc6f67fd1e87f7978e8919c4af528a9f1677d8d70209b2bb46d6a196f26ad37')
sha512sums=('ac7211eafe8e1534d65a26b235e2558712ce91ecfb529a097974e749ef07d4ae232cd10411561f4f759df920b3133b8a57089c7f77d5a0bd5a0b56352724fae7')

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
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"

  cd "${pkgdir}/${_gemdir}"
  rm -rf cache gems/${_gemname}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
