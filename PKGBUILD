# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=factory_bot
pkgname=ruby-$_gemname
pkgver=6.5.0
pkgrel=1
pkgdesc='Provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures'
arch=(any)
url="https://github.com/thoughtbot/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(ruby-rake)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"https://github.com/thoughtbot/factory_bot/commit/59b7188c7ed156433bd6ed1cd61da4be2966bd11.patch")
sha512sums=('ce87da897d20668196b99bdad07ab14f0f825ced33dc7625623010ec1129dd554f5830be89e933afc2537917f9d5ad2e66ffd72486b544650b6b94f4a01ac709'
            'fffdc85ffebb1ebeeeedae3d27dcc68f264e9652357bb560f1632b7bb73818102968632f914d00a7b532f25b5c7f3e84d2d3c7b8e305fc53c379190e259efa04')

prepare() {
  cd "${_gemname}-${pkgver}"
  patch -p1 -i ../59b7188c7ed156433bd6ed1cd61da4be2966bd11.patch
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
