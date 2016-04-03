# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=celluloid-extras
pkgname=ruby-${_gemname}
pkgver=0.20.5
pkgrel=1
pkgdesc='Classes to support examples, benchmarks, or add special functionality'
url='https://github.com/celluloid/celluloid-extras'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-timers')
makedepends=('git')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/celluloid-extras/archive/v${pkgver}.tar.gz
        culture-git::"git+https://github.com/celluloid/culture#commit=29baead")
sha512sums=('99f78a8f5761d205acc5ec1a2e88889eca59b7c4c979e959f691c60e7700dd06ad72afa88d785451bbf0ec554f6fdb2e7f2fae5870020ad0a6676522832f6767'
            'SKIP')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -not -path "*culture*" -print0|' -i *.gemspec
  rmdir culture
  cp -ra "${srcdir}/culture-git" culture
}

build() {
  cd ${_gemname}-${pkgver}
  gem build celluloid-extras.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" celluloid-extras*.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
