# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=celluloid-io
pkgname=ruby-${_gemname}
pkgver=0.17.3
pkgrel=1
pkgdesc='Evented IO for Celluloid actors'
url='https://github.com/celluloid/celluloid-io'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-timers' 'ruby-celluloid' 'ruby-nio4r')
makedepends=('git')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/celluloid-io/archive/v${pkgver}.tar.gz
        culture-git::"git+https://github.com/celluloid/culture#commit=d76f772")
sha512sums=('fbd9c443f724e03b523178cba77b682f0c4093ac73fc76aca483f6e02a7f1b062512a1c1dd2e099ee50a776502163bdf16336f4782b26b2211dd6ec6afd833bc'
            'SKIP')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find -not -path "*culture*"|' -i *.gemspec
  rmdir culture
  cp -ra "${srcdir}/culture-git" culture
}

build() {
  cd ${_gemname}-${pkgver}
  gem build celluloid-io.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" celluloid-io*.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
