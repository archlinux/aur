# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='html2haml'
pkgname="ruby-${_gemname}"
pkgver=2.3.0
pkgrel=1
pkgdesc="Converts HTML into Haml"
arch=('any')
url='https://haml.info/'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-erubis' 'ruby-haml' 'ruby-nokogiri' 'ruby-ruby_parser')
makedepends=('ruby-bundler' 'ruby-rake')
checkdepends=('ruby-minitest')
source=("https://github.com/haml/html2haml/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e6e09b430ac1d753438e3bebeff5dc27b03ec795d433a511216a3b43fc11f3439b63da274febda4bd25d8331e630c4cc4d0c12dda5ce5e1e56e9bd1468df392c')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  # ignore code coverage
  sed --in-place '/simplecov/d' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}/${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    "pkg/${_gemname}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "${pkgdir}/${_gemdir}/cache/" \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "${pkgdir}/${_gemdir}/gems/" \
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

  find "${pkgdir}/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete

  install --verbose -D --mode=0644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install --verbose -D --mode=0644 Changelog.markdown README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
