# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname=factory_bot
pkgname=ruby-$_gemname
pkgver=6.5.6
pkgrel=1
pkgdesc='A library for setting up Ruby objects as test data.'
arch=(any)
url="https://github.com/thoughtbot/${_gemname}"
license=(MIT)
options=(!emptydirs)
depends=(ruby ruby-activesupport)
makedepends=(ruby-rake)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7411f2bc1c1822cfb07a16e992415d07af35ca653e6fc1721132e0a819eaf693540f1d0ba77ff79468faba249a5a379f01c0471011af0f34bed6d5206ac54615')

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
