# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-core'
pkgname="ruby-${_gemname}"
pkgver=1.1.0
pkgrel=2
pkgdesc='A toolset of small support modules used throughout the dry-rb ecosystem'
arch=('any')
url="https://github.com/dry-rb/${_gemname}"
license=('MIT')
depends=(
  ruby
  ruby-concurrent
  ruby-zeitwerk
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-activesupport
  ruby-bundler
  ruby-dry-inflector
  ruby-rake
  ruby-rspec
)
optdepends=(
  'ruby-activesupport: inflection backend (preferred)'
  'ruby-dry-inflector: inflection backend'
)
options=('!emptydirs')
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}_fix_tests.patch"
)
sha512sums=(
  '2649b04c95b9e53048808c5df6a1346f6c54c862bac6d164aa8c4c4f5f333d778c555fa081cbbaedab83925e72027b6391418f6857936a4d8a0940005f8c0d52'
  'b2a0920f7a1724874d681edea4ab1c67330bbb484298fa8af55495c9f99fcf1105f77935667934f1848fdb1373b90b13eaf25d2ad50aa8211bf39902e02c5507'
)
b2sums=(
  'ec1cca6b3eba5d23c721993d681c1518e1f5466714dad0b6a7e77f1a5de5c5f805ff49ece775569fc257e5106f597e0cec610776aaa06a0cc298d79e3a9d1228'
  'b895adaa6a0fc35eac0cde70b74f799aebff78ca6df4291ce4f7534bec613d31f6bbcd62a46ce273b31d2b2d0439e1bba900ef74c1220c2d69ba2376cd6a29e1'
)

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # Exclude tests for `inflecto`, a dependency which is both optional
  # (i.e., unused if one of `activesupport/inflector` or `dry/inflector`
  # is available) and unmaintained upstream.
  patch --verbose --strip=1 --input="../${pkgname}_fix_tests.patch"

  # Exclude spec which would induce a circular checkdepends to
  # `ruby-dry-types`
  rm --force --verbose spec/dry/core/class_attributes_spec.rb
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
