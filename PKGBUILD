# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=hirb
pkgname=ruby-$_gemname
pkgver=0.7.3
pkgrel=1
pkgdesc="Provides a mini view framework for console applications and uses it to improve ripl(irb)'s default inspect output."
arch=(any)
url='http://tagaholic.me/hirb/'
license=(MIT)
options=(!emptydirs)
depends=(ruby)
makedepends=(ruby-rake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cldwalker/${_gemname}/archive/v${pkgver}.tar.gz")
sha512sums=('45b0ded2bd4b184b4a07b3b00374a00f1bfdeba64e1a68f0727ffc3f9ee25257114427cd7018fef94f452b1154ad0c5ab48ebdc4f075bee41dcce3824aa33d7f')

prepare() {
  cd "${_gemname}-${pkgver}"

  sed -r 's|~>|>=|g' -i ".gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build ".gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
