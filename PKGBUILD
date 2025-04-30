# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-logic'
pkgname="ruby-${_gemname}"
pkgver=1.6.0
pkgrel=1
pkgdesc='Predicate logic with rule composition'
arch=('any')
url='https://github.com/dry-rb/dry-logic'
license=('MIT')
depends=(
  ruby
  ruby-concurrent
  ruby-dry-core
  ruby-zeitwerk
  ruby-bigdecimal
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-rake
  ruby-rspec
  ruby-warning
)
options=('!emptydirs')
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha512sums=(
  '9ec100d08213e85d4164de672861c8507abe67fde67edbe90ca0c0076097007aad935c98d58544e210d6e603e07cdd57b0140c45b458908739d9b76db7855604'
)
b2sums=(
  'f030a293fca7153ff4c06909cdd1ac3eba09bb9b7237f4ffa3b7663bc08b4e9c1cd86d1caed8cac0fd1d1392d1d3d1b966425d5e2fc2c7129285bc9528015818'
)

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
