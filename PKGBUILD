_name=multi_xml
pkgname=ruby-multi_xml
pkgver=0.8.1
pkgrel=1
pkgdesc="Provides swappable XML backends utilizing LibXML, Nokogiri, Ox, or REXML."
arch=('any')
url="https://github.com/sferik/multi_xml"
license=('MIT')
depends=('ruby')
makedepends=(
  git
)
checkdepends=(
  ruby-rake
  ruby-bundler
  ruby-rdoc
  ruby-rubocop
)
source=("${_name}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('2b5061a1119cbd4243bd1745bf3a3072a825c0e08e4e1d8622a33981589553f5')

prepare() {
  cd "${_name}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
}

build() {
  cd "${_name}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --build-root "tmp_install" \
    "${_name}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
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

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

# requires standardrb 
# check() {
#   cd "${_name}-${pkgver}"
#
#  local _gemdir="$(gem env gemdir)"
#
#  GEM_HOME="tmp_install/${_gemdir}" rake test
# }

package() {
  cd "${_name}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.md --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
