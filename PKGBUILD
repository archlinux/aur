# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='webmock'
pkgname="ruby-${_gemname}"
pkgver=3.8.0
pkgrel=2
pkgdesc='Allows stubbing HTTP requests and setting expectations on HTTP requests.
'
arch=('any')
url='https://github.com/bblimke/webmock'
license=('MIT')
makedepends=('ruby-rdoc')
checkdepends=('ruby-rake' 'ruby-minitest' 'ruby-test-unit' 'ruby-rspec')
depends=('ruby' 'ruby-crack' 'ruby-hashdiff' 'ruby-addressable')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        'disable-unneeded-dependencies.patch')
sha512sums=('1dc76e9a43c9746d771a53106d02e2a2506be49f9e17ab5628ac6f6afdcc3d4112878f01287fcd97a3fdcb55f4d30e345666a68472e8d451414ca8f41046928f'
            'd946429e8f4f90ef263e8b28b4b536b2d81a46f48076a64f5a68ea06fa9abb19470c9bd14035d086d8e054b0df9085f5793b1aa38ffda576b5161852ddae64aa')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # we build based on a tar ball, so `git` won't work
  sed --in-place 's|git ls-files|find|' "${_gemname}.gemspec" spec/quality_spec.rb

  # disable unneeded dependencies
  patch --forward --verbose --strip=1 --input='../disable-unneeded-dependencies.patch'
  sed --in-place '/bundler/d' Rakefile
  sed --in-place '/Bundler/d' Rakefile
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  rake minitest
  rake test

}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/${_gemdir}/cache"
  rm -rf "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/"{test,spec,minitest,.gemtest,.gitignore,.travis.yml}
}

# vim: ts=2 sw=2 et:
