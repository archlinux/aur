# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>
# Contributor: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-monads'
pkgname="ruby-${_gemname}"
pkgver=1.10.0
pkgrel=1
pkgdesc='Common monads for Ruby'
arch=('any')
url='https://github.com/dry-rb/dry-monads'
license=('MIT')
depends=(
  ruby
  ruby-concurrent
  ruby-dry-core
  ruby-zeitwerk
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-debug-inspector
  ruby-dry-types
  ruby-rake
  ruby-rspec
  ruby-super_diff
  ruby-warning
)
optdepends=(
  'ruby-debug-inspector: reference constants from other modules, such as rspec helpers'
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('59cbe976658e2b937acd12a5873b55ed369bc84b7adde81803b3f0c1864029463f2becfaefbde67ac11de29b4bf9ebfe92fe7f72a3c47213676639d383284cde')
b2sums=('6b82674569b0abb5a4c64a7634f7d95129fc83fe274781429cff4e160c5446659e786efd6b0f6879e7b3bf8f689b0453f98414b35f5d3f5620e5cbb0769f6c6b')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended \
    --expression 's|~>|>=|g' \
    "${_gemname}.gemspec"
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
