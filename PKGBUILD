_name='syck'
pkgname="ruby-syck"
pkgver=1.5.1.1
pkgrel=1
pkgdesc='Syck from stdlib turned in to a gem'
arch=('any')
url="https://github.com/ruby/${_name}"
license=('MIT')
depends=('ruby')
checkdepends=('ruby-bundler' 'ruby-rake-compiler' 'ruby-test-unit')
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/ruby-syck-${pkgver}.tar.gz")
b2sums=('be3b551cbb15b07f996bf1498c67385a902a18e8b4246b8eaf2c11c9078487f72295327a8f209553105ff3badea4b8dcb71de477e90be1c30ed6f438c1e1412f')

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
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
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

check() {
  cd "${_name}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd "${_name}-${pkgver}"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 *.rdoc --target-directory "${pkgdir}/usr/share/doc/syck"
}
