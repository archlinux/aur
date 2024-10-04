# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-types'
pkgname="ruby-${_gemname}"
pkgver=1.7.2
pkgrel=2
pkgdesc='Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc'
arch=('any')
url="https://github.com/dry-rb/${_gemname}"
license=('MIT')
depends=(
  ruby
  ruby-bigdecimal
  ruby-concurrent
  ruby-dry-core
  ruby-dry-inflector
  ruby-dry-logic
  ruby-zeitwerk
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-dry-monads
  ruby-dry-struct
  ruby-rake
  ruby-rspec
  ruby-warning
  ruby-yard
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('401372b73b55947d1ba6619903cacd422be1a04ffdd3746d3323a68afa98fcea3d87a4bf1d81a9e9a389b2dcd8dd3a9d096f6982d168528d9fadf60e0fc33076')
b2sums=('e0ebd390bea2178a9a348b65bc7cb5af8657d61f66a77ba52ba26e64aab44c2bd6d142c164c023002244aded5da7175199108c069635b1031d469d7e678f0ed1')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build --verbose "${_gemname}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_gemname}-${pkgver}.gem"

  # remove unreproducible files
  rm --force --recursive --verbose \
    "tmp_install${_gemdir}/cache/" \
    "tmp_install${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "tmp_install${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "tmp_install${_gemdir}/gems/" \
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

  find "tmp_install${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install${_gemdir}" rake run_specs
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
