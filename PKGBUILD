# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=ruby-jekyll-include-cache
_name=jekyll-include-cache
pkgver=0.2.1
pkgrel=1
pkgdesc='Jekyll plugin to cache the rendering of Liquid includes'
arch=('any')
url='https://github.com/benbalter/jekyll-include-cache'
license=('MIT')
depends=(
  'jekyll'
  'ruby'
)
makedepends=(
  'ruby-rake'
  'rubygems'
)
checkdepends=(
  'ruby-rspec'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/benbalter/jekyll-include-cache/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '5e10d533fd7daeb76bda45d203575c4bf1c363be0fe996f62dc149169e7632286a5f60e5f2a734b2d173b4eca10b166f5dafc799d0adcdf14051bc68b58f0eae'
)

prepare() {
  cd "${_name}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' \
    "${_name}.gemspec"

  # we don't build from a git checkout
  sed --in-place --regexp-extended 's|git ls-files app lib|find lib -type f|' \
    "${_name}.gemspec"
}

build() {
  cd "${_name}-${pkgver}"

  local _gemdir
  _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
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

  rmdir \
    "tmp_install/${_gemdir}/build_info/" \
    "tmp_install/${_gemdir}/extensions/" \
    "tmp_install/${_gemdir}/plugins/"
}

check() {
  cd "${_name}-${pkgver}"

  local _gemdir
  gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rspec
}

package() {
  cd "${_name}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.md --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
