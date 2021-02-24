# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=puma
pkgname=ruby-$_gemname
pkgver=5.2.1
pkgrel=1
pkgdesc='A Ruby/Rack web server built for concurrency'
arch=(any)
url='https://puma.io/'
license=(BDS-3-CLAUSE)
options=(!emptydirs)
depends=(ruby)
makedepends=(git ruby-rake)
source=("${pkgname}-${pkgver}::git+https://github.com/puma/puma.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -r 's|~>|>=|g' -i "${_gemname}.gemspec"
}

build() {
  cd "${pkgname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

package() {
  cd "${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
