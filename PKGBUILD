# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=celluloid-supervision
pkgname=ruby-${_gemname}
pkgver=0.20.6
pkgrel=1
pkgdesc='Simple finite state machines with integrated Celluloid timeout support'
url='https://github.com/celluloid/celluloid-supervision'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-timers')
makedepends=('git')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/celluloid-supervision/archive/v${pkgver}.tar.gz
        culture-git::"git+https://github.com/celluloid/culture#commit=d76f772")
sha512sums=('f27d873641bf732822f1c65a8344a2c3bb611040ff0b3c72baff44ad3166f9a872e3dc536310a725f6ae91f1664ff72eba77c3192325ec52a25b7efee1beeaed'
            'SKIP')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -not -path "*culture*" -print0|' -i *.gemspec
  rmdir culture
  cp -ra "${srcdir}/culture-git" culture
}

build() {
  cd ${_gemname}-${pkgver}
  gem build celluloid-supervision.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" celluloid-supervision*.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
