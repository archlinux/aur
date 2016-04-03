# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=celluloid
pkgname=ruby-${_gemname}
pkgver=0.17.3
pkgrel=1
pkgdesc='Celluloid provides a simple and natural way to build fault-tolerant concurrent programs in Ruby'
url='https://github.com/celluloid/celluloid'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-timers' 'ruby-celluloid-supervision' 'ruby-celluloid-pool' 'ruby-celluloid-fsm' 'ruby-celluloid-extras' 'ruby-celluloid-essentials')
makedepends=('git')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/celluloid/archive/v${pkgver}.tar.gz
        culture-git::"git+https://github.com/celluloid/culture#commit=d76f772")
sha512sums=('14e0da06024a884ae4a949906e7a2e518215bc69161e6ce1aead65b4356f2487d25618be44fd06200d2a5b04e68b89c99020d4329bb58aaad2355cd138e7524c'
            'SKIP')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -not -path "*culture*" -print0|' -i *.gemspec
  rmdir culture
  cp -ra "${srcdir}/culture-git" culture
}

build() {
  cd ${_gemname}-${pkgver}
  gem build celluloid.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" celluloid*.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
