# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_gemname=timers
pkgname=ruby-${_gemname}
pkgver=4.3.3
pkgrel=1
pkgdesc='Schedule procs to run after a certain time, or at periodic intervals, using any API that accepts a timeout'
url='https://github.com/celluloid/timers'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-hitimes')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/celluloid/timers/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4a715e4a786f98ec429a250de53cfa67bed6b5a99b6298c21251e6dcf1315f1185d8c45bea01025832046381ebac462cd35415f7573d58c55c30b47c2567d4bf')
b2sums=('af64b44116565a8cb6b68349de6a46e8b67d22508e16e204af104ed7a59cc1db1dae0c36917ccde1932c33e53d9d71fc57cb317570cc24aaee82531ce178f37c')

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
