# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-core'
pkgname="ruby-${_gemname}"
pkgver=1.2.0
pkgrel=1
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
sha512sums=('55c5cbf6bfcca8aca13fdb36f409342b20c981d3d1a24dc895a2ee533cc4674869779a2d6e109e06593484e488d001333a8ab1bde4c29c81744aa77321afe210'
            'b2a0920f7a1724874d681edea4ab1c67330bbb484298fa8af55495c9f99fcf1105f77935667934f1848fdb1373b90b13eaf25d2ad50aa8211bf39902e02c5507')
b2sums=('e55fe4c6d6272c24f1984ab5f20ff6b2319c1d14440c857908ef29cd3c2541386bbe656f9b37ea2c078bfde3af989e740ecbe94fd107465d1bec13ee84c32ef1'
        'b895adaa6a0fc35eac0cde70b74f799aebff78ca6df4291ce4f7534bec613d31f6bbcd62a46ce273b31d2b2d0439e1bba900ef74c1220c2d69ba2376cd6a29e1')

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
