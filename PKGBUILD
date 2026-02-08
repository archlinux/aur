# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-inflector'
pkgname="ruby-${_gemname}"
pkgver=1.3.1
pkgrel=1
pkgdesc='String inflections for dry-rb'
arch=('any')
url="https://github.com/dry-rb/${_gemname}"
license=('MIT')
depends=(
  ruby
)
makedepends=(
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-rake
  ruby-rexml
  ruby-rspec
  ruby-warning
)
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0efdf00224189c0401b1fd5bc09506ed62adcd7ebb2316489f9706df3135d97c4b2ed22c5625270d2898d82c408fa4beb032b9cb6783cca500f1b487ba1a059f')
b2sums=('878d59ae269bd515d559c41bb2ff8cc773a6055a7fda96747d36c22017f70bad64e27d77ec4f76b52057c379cdc4f757d32b6f4a7fd3fc4211c5f3eb907af9a3')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  sed --in-place --regexp-extended \
    --expression '/simplecov/d' \
    --expression '/group :benchmarks/,/end/d' \
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

  COVERAGE=false GEM_HOME="tmp_install${_gemdir}" rake spec
}

package() {
  cd "${_gemname}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE* --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: tabstop=2 shiftwidth=2 expandtab:
