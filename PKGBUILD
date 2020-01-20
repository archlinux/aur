# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='webmock'
pkgname="ruby-${_gemname}"
pkgver=3.8.0
pkgrel=1
pkgdesc='Allows stubbing HTTP requests and setting expectations on HTTP requests.
'
arch=('any')
url='https://github.com/bblimke/webmock'
license=('MIT')
makedepends=('ruby-rdoc' 'ruby-bundler')
checkdepends=('ruby-rake' 'ruby-minitest' 'ruby-test-unit' 'ruby-rspec' 'ruby-httpclient')
depends=('ruby' 'ruby-crack' 'ruby-hashdiff' 'ruby-addressable')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('1dc76e9a43c9746d771a53106d02e2a2506be49f9e17ab5628ac6f6afdcc3d4112878f01287fcd97a3fdcb55f4d30e345666a68472e8d451414ca8f41046928f')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  sed --in-place 's|git ls-files|find|' "${_gemname}.gemspec"
  sed --in-place '/test_files/d' "${_gemname}.gemspec"
  sed --in-place '/executables/d' "${_gemname}.gemspec"
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  #rake spec
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}

# vim: ts=2 sw=2 et:
