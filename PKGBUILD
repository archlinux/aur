# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=database_cleaner-core
pkgname=ruby-$_gemname
pkgver=2.0.1
pkgrel=1
pkgdesc='Strategies for cleaning databases. Can be used to ensure a clean slate for testing.'
arch=(any)
url="https://github.com/DatabaseCleaner/database_cleaner"
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(git ruby-rake)
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
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
