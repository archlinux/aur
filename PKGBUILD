# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=execjs
pkgname=ruby-$_gemname
pkgver=2.9.1
pkgrel=3
pkgdesc='Run JavaScript code from Ruby'
arch=('any')
url='https://github.com/rails/execjs'
license=('MIT')
depends=('ruby')
checkdepends=('nodejs')
makedepends=('ruby-rdoc')
optdepends=('nodejs: Node.js runtime')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${_gemname}-${pkgver}.tar.gz")
sha256sums=('91355ddd70ae423254d0447a92c7fc94b037062e8d0fc1da7bd38971c6d92161')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files -z|find -type f -print0\|sed "s,\\\\./,,g"|' -i ${_gemname}.gemspec
  sed -r 's|~>|>=|g' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

check() {
  cd ${_gemname}-${pkgver}
  rake test
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 MIT-LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/${_gemdir}/cache"
}
