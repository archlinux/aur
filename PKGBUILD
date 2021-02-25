# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=database_cleaner
pkgname=ruby-$_gemname
pkgver=2.0.1
pkgrel=1
pkgdesc='Strategies for cleaning databases. Can be used to ensure a clean slate for testing.'
arch=(any)
url="https://github.com/DatabaseCleaner/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby-database_cleaner-active_record)
makedepends=(ruby-rake)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b41d5388c74ccaf9e72f9e6ab6b7cc6ead2706409236b38419d7ef3935b90766e04ad2bfef0ee58a07c0b9051452cab314545cd023853985aac46efaf0922eaa')

prepare() {
  cd "${_gemname}-${pkgver}"

  sed -r 's|~>|>=|g' -i "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
