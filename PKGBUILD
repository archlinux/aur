# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gemname=mercenary
pkgname=ruby-mercenary-0.3
pkgver=0.3.6
pkgrel=1
pkgdesc='Easier way to build your command-line scripts'
url='https://github.com/jekyll/mercenary'
arch=('any')
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
provides=("ruby-mercenary=$pkgver")
conflicts=("ruby-mercenary=$pkgver")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jekyll/mercenary/archive/v${pkgver}.tar.gz)
sha256sums=('61c10e3a54c526b9a6f41af27ec6ca540d37d34a5ad413d615d3342dcaaa518c')
sha512sums=('d8759a8f27611b6bc54202e51f06a557fe7b289a262bf692076a3b3d347d45cd65e2a6a9d080e331714ef8df50b200f56b3caab5d4bc32804e8cb5bbe43ebc2e')

prepare() {
  cd ${_gemname}-${pkgver}
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec # don't give a fuck about rubys bla bla
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname}/example"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}

# vim: ts=2 sw=2 et:
