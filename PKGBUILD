# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-types'
pkgname="ruby-${_gemname}"
pkgver=1.8.3
pkgrel=1
pkgdesc='Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc'
arch=('any')
url='https://github.com/dry-rb/dry-types'
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
  ruby-rake
  ruby-rspec
  ruby-warning
  ruby-yard
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('aec3d2decae270715ab251feca1d598b2102850367c7fb5763ec3dd5bacfbb7edd3cd7b6f2e1b6511f1e5f5cf8ebd40626079b718ac395dbe3a63a219fd19505')
b2sums=('ca316ede356c82928dbf49a20b80d294b1a96cb0a3d80c5b701375ab228c3ec5c77f6474c5ca85968734be39f34be8c1e8b3638c6195dc0124a7cdb5accba49d')

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

  # Exclude `module_spec`, which requires a circular
  # checkdepends to `ruby-dry-monads`
  GEM_HOME="tmp_install${_gemdir}" \
    find spec/dry -name 'module_spec.rb' -prune -o \
      -name '*_spec.rb' -exec rspec '{}' +
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
