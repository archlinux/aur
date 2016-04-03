# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=celluloid-supervision
pkgname=ruby-${_gemname}
pkgver=0.20.5
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
sha512sums=('0fca953b6ade756574040b8e34e8ac4ea3d392628a9fb14a8d52f39ca3f92371e335520b673dec8fc9a4a44a208b38f51c9c23e2218510078ded64c903533bc8'
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
