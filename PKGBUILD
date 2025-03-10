# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=ruby-just-the-docs
_name=just-the-docs
pkgver=0.10.1
pkgrel=1
pkgdesc='Jekyll theme for documentation with built-in search'
arch=('any')
url='https://github.com/just-the-docs/just-the-docs'
license=('MIT')
depends=(
  'jekyll'
  'ruby'
  'ruby-bundler'
  'ruby-jekyll-include-cache'
  'ruby-jekyll-seo-tag'
)
makedepends=(
  'ruby-rake'
  'rubygems'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/just-the-docs/just-the-docs/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'b69ebcf8c34e3f9982140a61849ae1753e9daf605338d38822542bd3fc3c39b54aa4d0edcb45bc4ecaf00b5cfab4b2f67a35e01030762dadafa979f27aa564d2'
)

prepare() {
  cd "${_name}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' \
    "${_name}.gemspec"

  # we don't build from a git checkout
  sed --in-place --regexp-extended \
    -e 's|git ls-files [^`]+|find . -"(" -path ./.git -o -name "*.png" -o -name "*.jpg" -")" -prune -o -type f -print0|' \
    -e 's|(%r\{\^)|\1\./|' \
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

package() {
  cd "${_name}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 \
    --target-directory "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
  install --verbose -D --mode=0644 \
    --target-directory "${pkgdir}/usr/share/doc/${pkgname}" \
    -- *.md
}
