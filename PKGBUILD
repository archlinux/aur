# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-types'
pkgname="ruby-${_gemname}"
pkgver=1.8.2
pkgrel=3
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
  ruby-rake
  ruby-rspec
  ruby-warning
  ruby-yard
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f034271d43f91162bd9ac5d5b309b91ec088141b2db9ac59c03059b173480ca552d561c122defe924ca0636abac6bc1516ee2984ec6eac0985e2b51e76c2e311')
b2sums=('acc67223f4429210d8fe5397a11d2383f9425504e6dd4679f87f69ee54084f59c11d99b37eb2f6853818c96747376e4ed100aa2cd8c515d60288fb59a5b75621')

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
