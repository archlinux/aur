# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_gemname=timers
pkgname=ruby-${_gemname}
pkgver=4.3.5
pkgrel=1
pkgdesc='Schedule procs to run after a certain time, or at periodic intervals, using any API that accepts a timeout'
url='https://github.com/celluloid/timers'
arch=('any')
license=('MIT')
depends=('ruby' 'ruby-hitimes')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://github.com/celluloid/timers/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('fa5a25eda15628f5a17cd2e7acc4eb2819a766de7ffdba03d425a93cb3229f0f7b8083e9990b5308e65c2d8aab396e33dd4d152252888eff1cc0039cac6a5e46')
b2sums=('2dc34bb23a4971c673aff5120502714035fe31aed34854b5f7beb744ca46ad704b88d1403ad594ea49f71bb709db7942ed521d237e2477fe2e9d41cc3cd2b538')

prepare() {
  cd ${_gemname}-${pkgver}
  sed 's|git ls-files|find|' -i ${_gemname}.gemspec
  sed '/spec.signing_key.*/d' -i ${_gemname}.gemspec
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

  install -Dm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 license.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/${_gemdir}"
  rm -rf cache gems/${_gemname}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${_gemname}-${pkgver}/{mkmf.log,gem_make.out}
}

# vim: ts=2 sw=2 et:
