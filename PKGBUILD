# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=travis-gh
_name=gh
pkgname=ruby-$_gemname
pkgver=0.21.0
pkgrel=2
pkgdesc='Layered GitHub API client'
arch=(any)
url='https://github.com/travis-ci/gh'
license=(MIT)
depends=(ruby-activesupport ruby-addressable ruby-faraday ruby-faraday-retry ruby-faraday-typhoeus ruby-multi_json ruby-net-http-persistent ruby-net-http-pipeline)
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5e01a6f9ee1bacdcc685a684599dc0292717eee0366172110d51f9a0c38b857c')

prepare() {
  cd "${_name}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
}

build() {
  cd "${_name}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_name}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

package() {
  cd "${_name}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"
}
