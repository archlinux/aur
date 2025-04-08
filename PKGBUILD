# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=database_cleaner
pkgname=ruby-$_gemname
pkgver=2.1.0
pkgrel=1
pkgdesc='Strategies for cleaning databases. Can be used to ensure a clean slate for testing'
arch=(any)
url="https://github.com/DatabaseCleaner/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby-database_cleaner-active_record)
makedepends=(ruby-rake)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7bcceba63399698a98d299e5b15480682885c360e0177cb521c435ce087d8b53e09c0acd0d32a051551208a6cb0f5e926ffd44e7d641e35d438fddb9535acf6c')

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
