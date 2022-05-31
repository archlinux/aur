# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=eventmachine
pkgname=ruby-${_gemname}-1.0
pkgver=1.0.9.1
pkgrel=1
pkgdesc='Fast, single-threaded engine for arbitrary network communications'
url="https://rubygems.org/gems/$_gemname/versions/${pkgver}"
arch=('x86_64')
license=('Ruby' 'GPL2')
depends=('gcc-libs' 'glibc' 'ruby' 'openssl')
makedepends=('ruby-rdoc')
provides=("${pkgname%-1.0}=${pkgver}")
options=('!emptydirs')
source=("${pkgname%-1.0}-${pkgver}.tar.gz::https://github.com/eventmachine/eventmachine/archive/v${pkgver}.tar.gz")
b2sums=('ee5468cde4ba76922180e164e50c186837b5be7792aa8bb03306fdb4500131fdb6c9707dc34861f5e1ab5103f5fa31aaa54d2cc80627648265152f2c3530e095')

prepare() {
  cd "${_gemname}-${pkgver}"
  sed 's|git ls-files README.md CHANGELOG.md GNU LICENSE|find|' -i "${_gemname}.gemspec"
  sed 's|git ls-files|find|' -i "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}*.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # remove cached entries and logs for reproducible build
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem" \
      "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/fastfilereader/Makefile" \
      "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/ext/Makefile"
  rm -rf "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"
  find "${pkgdir}/${_gemdir}" \( -name 'mkmf.log' -or -name 'gem_make.out' \) -delete
}
