# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_gemname=timers
pkgname=ruby-${_gemname}
pkgver=4.3.2
pkgrel=2
pkgdesc='Schedule procs to run after a certain time, or at periodic intervals, using any API that accepts a timeout'
url='https://github.com/celluloid/timers'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-hitimes')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/celluloid/timers/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('306669da275e26f2902c05c94fd94caf15a37dafa6dc5ec16b3780091dea72ed6c2ff41d05139244ff1191f5630d3ffbab2718e04be67f784643386ca456f450')
b2sums=('2f04c012f161c3af53103e5c5f05da53f089b2db2b356cb271f3ad318c2b66d78a2275665b27fb718dfeab7e8f76993637153eae193616f84f3da1c3db42680d')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
}

build() {
  cd ${_gemname}-${pkgver}
  gem build ${_gemname}.gemspec
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/${_gemdir}"
  rm -rf cache gems/${_gemname}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
