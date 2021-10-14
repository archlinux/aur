# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>

_gemname=test-unit
pkgname="ruby27-${_gemname}"
pkgver=3.4.1
pkgrel=1
pkgdesc='An xUnit family unit testing framework for Ruby'
arch=('any')
url="https://github.com/${_gemname}/${_gemname}"
license=('GPL')
depends=('ruby2.7' 'ruby27-power_assert')
makedepends=('ruby27-rdoc')
options=('!emptydirs')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('505262c6100fc43496c6b831cc22a98dd73351787c73903e6d2e776ad2987b5d5010c0d7e3bc568486825578aa8a2c69cf9d99cb3da655bf79424ab2f92baa94')

# fix wrong license identifier to match the official ones from https://spdx.org/licenses/
prepare() {
  cd "${_gemname}-${pkgver}"
  sed --in-place 's/spec.licenses.*/spec.licenses = ["BSD-2-Clause", "PSF-2.0", "Ruby"]/' "${_gemname}.gemspec"
}

build() {
 cd "${_gemname}-${pkgver}"
 gem-2.7 build "${_gemname}.gemspec"
}

check() {
  cd "${_gemname}-${pkgver}"
  ruby-2.7 test/run-test.rb
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(gem-2.7 env gemdir)"
  gem-2.7 install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm -rf "${pkgdir}/${_gemdir}/cache"

  install -Dm 644 README.md doc/text/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 BSDL COPYING PSFL -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
