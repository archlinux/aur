# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=nio4r
pkgname=ruby-${_gemname}
pkgver=2.0.0
pkgrel=1
pkgdesc='Abstract, cross-platform stateful I/O selector API for Ruby'
url='https://github.com/celluloid/nio4r'
arch=('i686' 'x86_64')
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/celluloid/nio4r/archive/v${pkgver}.tar.gz)
sha512sums=('433a98971a735abf0ee3f5473a6acb824ea3322b7418147aacc578260bcc9b989e491d4331c61b94935d048bad655c1c4f552adf58c5da3ec36a589eafa961ca')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i *.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build nio4r.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" nio4r*.gem
  install -Dm 644 README.md CHANGES.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
  find "${pkgdir}/${_gemdir}" \( -name 'mkmf.log' -or -name 'gem_make.out' \) -delete
}

# vim: ts=2 sw=2 et:
