# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-types'
pkgname="ruby-${_gemname}"
pkgver=1.9.1
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
sha512sums=('e704119e2eac927b39fc9d49938acdce3b9f288e2c660a5054ea292aa0220fca86edfce006815af3adffeeffc4118aa244e1b86cb9fb4e53241bbea61a4681aa')
b2sums=('9c2ed18c2b82fafadcc0774c6e12a9d46399a9d43c4b431d62e3b358df63aaf324aa1aff0a6071d1ac77f55e9b3f0b198016ba8c94bb91d77c3f29ae24d7fcd6')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  sed --in-place --regexp-extended \
    --expression '/lefthook/d' \
    --expression '/group :tools/,/end/d' \
    Gemfile \
    Gemfile.devtools
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

  # - Exclude `module_spec`, which requires a circular
  #   checkdepends to `ruby-dry-monads`
  # - Exclude `sum_spec`, which requires a circular
  #   checkdepends to `ruby-dry-struct`
  GEM_HOME="tmp_install${_gemdir}" \
    find spec/dry \
      -regex 'spec/dry/types/\(module\|sum\)_spec\.rb' -prune -o \
      -name '*_spec.rb' -exec rspec '{}' +
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
