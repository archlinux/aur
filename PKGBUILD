# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-struct'
pkgname="ruby-${_gemname}"
pkgver=1.8.0
pkgrel=1
pkgdesc='Typed structs and value objects'
arch=('any')
url="https://github.com/dry-rb/${_gemname}"
license=('MIT')
depends=(
  ruby
  ruby-dry-core
  ruby-dry-types
  ruby-ice_nine
  ruby-zeitwerk
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-dry-monads
  ruby-rake
  ruby-rspec
  ruby-warning
  ruby-yard
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('da2cca1c540da9f8d29dd0a8a529a313a4f6552d4bd345b80e8b8f96d35c00d01928c2824927925582e4324a2efa0c1446a13087fa9acb94ddd38018b5f47420')
b2sums=('23122044c88223724b284b4e692e4f8d4c49b376433a3c024fed13baad46ea507a9212d00c39545639b9385996b5a2a8403c47eb30f70d25f52c1f2b5c197853')

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

  GEM_HOME="tmp_install${_gemdir}" rake spec
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
