_name='base64'
pkgname="ruby-base64-nonstd"
pkgver=0.2.0
pkgrel=1
pkgdesc='Support for encoding and decoding binary data using a Base64 representation'
arch=('any')
url="https://github.com/ruby/${_name}"
license=('BSD' 'RUBY')
depends=('ruby')
checkdepends=('ruby-bundler' 'ruby-rake' 'ruby-test-unit')
options=('!emptydirs')
#provides=("ruby-base64=0.2.0")
source=("${url}/archive/v${pkgver}/ruby-base64-${pkgver}.tar.gz")
b2sums=('a70b357f4998925dc9c6c365e23f0c45eca100170271d2daf3ead56a3656d0a5cc77f8d4e84796c486a7f96dcf520e0a4ba22d3b880926afe41f0603952a93ef')

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

  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/ruby-base64"
}
