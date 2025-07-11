# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_name='uri-ssh_git'
pkgname="ruby-uri-ssh_git"
pkgver=2.0.0
pkgrel=1
pkgdesc='Parse and build git repository url via ssh protocol.'
arch=('any')
url="https://github.com/packsaddle/${pkgname}"
license=('MIT')
depends=(ruby)
checkdepends=('ruby-bundler' 'ruby-rake' 'ruby-test-unit' 'ruby-yard')
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('5dc53b8e39e0f42e05e49d60c30f2cd592d83d39054a6ad112ef282c24a7c00ef5acd6c117fcb0deb22bf36561e9d5c70fc230767f3084e818fb4a6fcad589bf')

prepare() {
  cd "${pkgname}-2.0.0"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_name}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
}

build() {
  cd "${pkgname}-2.0.0"

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
  cd "${pkgname}-2.0.0"

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake test
}

package() {
  cd "${pkgname}-2.0.0"

  cp --archive --verbose tmp_install/* "${pkgdir}"
}
