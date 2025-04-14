# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

_gemname='dry-inflector'
pkgname="ruby-${_gemname}"
pkgver=1.2.0
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
sha512sums=('3345a66caf6b6dc62e6ce6ebc1704b4dc8377cbf203a54b34c4a47e7cdc40551fdcb68cbfb616dd9ed0ce635e52826f73fea83dc86b53e55618c772eafcebe0d')
b2sums=('aa34171c2e059097da1f3e66b43a177e8a66abde488a8a1024991665ebb4fef1687382fdfd367ba71ba9fe1a44183aa58f82806a80d6fb8650008f84bac6c248')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  sed --in-place --regexp-extended \
    --expression '/simplecov/d' \
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
