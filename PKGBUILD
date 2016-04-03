# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=celluloid-essentials
pkgname=ruby-${_gemname}
pkgver=0.20.5
pkgrel=2
pkgdesc='Internally used tools, and superstructural dependencies of Celluloid'
url='https://github.com/celluloid/celluloid-essentials'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-timers')
makedepends=('git')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/celluloid-essentials/archive/v${pkgver}.tar.gz
        culture-git::"git+https://github.com/celluloid/culture#commit=d76f772")
sha512sums=('66b03babcc5b0795147140e9a1d5552b6f8232c0ad3b444db04f397b919da57d7b4a0fa1427d2d0aa1904c6eefb78ddc7b0a607b8df9e7291d3a1732e6303d33'
            'SKIP')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -not -path "*culture*" -print0|' -i *.gemspec
  rmdir culture
  cp -ra "${srcdir}/culture-git" culture
}

build() {
  cd ${_gemname}-${pkgver}
  gem build celluloid-essentials.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" celluloid-essentials*.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
