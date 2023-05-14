# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=ruby-cool.io
_name=${pkgname#ruby-}
pkgver=1.7.1
pkgrel=2
pkgdesc='Simple evented I/O for Ruby'
arch=(x86_64)
url='https://github.com/tarcieri/cool.io'
license=(MIT)

depends=(ruby)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)

source=("${url}/archive/v${pkgver}/${_name}-v${pkgver}.tar.gz")
sha256sums=('64d6921b052f9e5894eef42b5b2d053ce62a933fe57c79b6c51a928bd1d77c89')

_archive="${_name}-${pkgver}"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"

  # we don't build from a git checkout
  sed --in-place --regexp-extended 's|git ls-files|find . -type f -not -path "*/\.git/*"|' "${_name}.gemspec"
}

build() {
  cd "$_archive"

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

check() {
  cd "$_archive"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rspec
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
