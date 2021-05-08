# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

_gemname='webmock'
pkgname="ruby-${_gemname}"
pkgver=3.11.2
pkgrel=1
pkgdesc='Allows stubbing HTTP requests and setting expectations on HTTP requests.'
arch=('any')
url='https://github.com/bblimke/webmock'
license=('MIT')
makedepends=('ruby-rdoc')
checkdepends=('ruby-rake' 'ruby-minitest' 'ruby-test-unit' 'ruby-rspec')
depends=('ruby' 'ruby-crack' 'ruby-hashdiff' 'ruby-addressable')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        'disable-unneeded-dependencies.patch')
sha512sums=('1ae384128df62cbde7725b110b9951ca58d5c92a7ba82d6a583af82243b8509ecd17a72c6dca27dc0dfb8f4c843a9f8207cf0e1c6bda459501614cc79fc4ed58'
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
