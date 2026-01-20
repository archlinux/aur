# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Richard Lees <git zero at bitservices dot io>
# Contributor: mnussbaum <michaelnussbaum08@gmail.com>
pkgname=ruby-reverse_markdown
_name=${pkgname#ruby-}
pkgver=3.0.2
pkgrel=1
pkgdesc="Ruby gem to convert html into markdown"
arch=('any')
url="https://github.com/xijo/reverse_markdown"
license=('WTFPL')
depends=('ruby-nokogiri')
makedepends=('rubygems')
#checkdepends=('ruby-rake')
options=('!emptydirs')
source=("${_name}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('925dc0a4064d62ce23e1bb3d4153c28e56eed91601c05a24590cca9101659dc2')

prepare() {
  cd "${_name}-$pkgver"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"

  # we don't build from a git checkout
  sed -ie 's|git ls-files|find . -type f -not -path "*/\.git/*"|' "${_name}.gemspec"
}

build() {
  cd "${_name}-$pkgver"
  local gemdir="$(gem env gemdir)"
  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
    "${_name}-$pkgver.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${gemdir}/cache/" \
    "tmp_install/${gemdir}/gems/${_name}-$pkgver/vendor/" \
    "tmp_install/${gemdir}/doc/${_name}-$pkgver/ri/ext/"

  find "tmp_install/${gemdir}/gems/" \
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

  find "tmp_install/${gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

#check() {
#  cd "${_name}-$pkgver"
#  local gemdir="$(gem env gemdir)"
#  GEM_HOME="tmp_install/${gemdir}" rake test
#}

package() {
  cd "${_name}-$pkgver"
  cp -a tmp_install/* "$pkgdir"
}
